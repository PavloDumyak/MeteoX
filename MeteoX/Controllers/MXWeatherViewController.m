//
//  MXWeatherViewController.m
//  MeteoX
//
//  Created by Pavlo Dumyak on 31.05.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import "MXWeatherViewController.h"
#import "MXHttpRequestManager.h"
#import "MXNetworkConstants.h"
#import "CurrentWeather.h"
#import "MXWeatherTableViewCell.h"
#import "MXCommon.h"
#import "ListWeather.h"

@interface MXWeatherViewController ()

@property(weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property(weak, nonatomic) IBOutlet UILabel *dateLabel;
@property(weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property(weak, nonatomic) IBOutlet UILabel *skyTypeLabel;
@property(weak, nonatomic) IBOutlet UILabel *cityLabel;
@property(weak, nonatomic) IBOutlet UIView *weatherPlaceholderView;
@property(weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) CurrentWeather *currentWeather;
@property(nonatomic, strong) NSArray <ListWeather *> *weekWeatherDataSource;
@property(nonatomic, strong) NSMutableArray *dateArray;

@end

@implementation MXWeatherViewController

#pragma mark -- controller's life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [self setupWeatherForLviv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- setup appearance

- (void)setupWeatherForLviv {
    [self getCurrentWeatherInTheCity:@"Lviv"];
    [self getWeatherOnTheWeekForCity:@"Lviv"];
}

- (void)setupUI {
    self.weatherPlaceholderView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
    self.searchBar.barTintColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
    self.searchBar.delegate = self;
    self.cityLabel.text = self.currentWeather.name;
    self.dateLabel.text = [MXCommon getCurrentDate];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%.1f", [MXCommon convertToCelcius:self.currentWeather.main.temp]];
    self.skyTypeLabel.text = self.currentWeather.weather[0].detail.capitalizedString;
    self.dateArray = [MXCommon getDateForAllWeek];
    [self setupTableView];
    self.searchBar.keyboardType = UIKeyboardTypeASCIICapable;
}

- (void)setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
}

#pragma mark -- http request

- (void)getCurrentWeatherInTheCity:(NSString *)city {
    NSString *formatedCity = [city stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *formatedUrl = [NSString stringWithFormat:mWeatherByCityNameURL,formatedCity];
    MXHttpRequestManager *httpRequest = [[MXHttpRequestManager alloc] initWithLink:formatedUrl];
    
    httpRequest.httpRequestSuccessHandler = ^(NSURLSessionDataTask *task,id responseObject) {
        
        NSDictionary *jsonObject=[NSJSONSerialization
                                  JSONObjectWithData:responseObject
                                  options:NSJSONReadingMutableLeaves
                                  error:nil];
        self.currentWeather = [EKMapper objectFromExternalRepresentation:jsonObject withMapping:[CurrentWeather objectMapping]];
        [self setupUI];
    };
    
    httpRequest.httpRequestFailHandler = ^(NSURLSessionDataTask *_Nullable task, NSError *error) {
        
        UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"Network error" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [errorAlert addAction:action];
        [self presentViewController:errorAlert animated:YES completion:nil];
        
    };
    
    [httpRequest sendRequest];
}


- (void)getWeatherOnTheWeekForCity:(NSString *)city {
    
    NSString *formatedCity = [city stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *formatedUrl = [NSString stringWithFormat:mWeatherForASixteenDayURL,formatedCity];
    MXHttpRequestManager *httpRequest = [[MXHttpRequestManager alloc] initWithLink:formatedUrl];
    
    httpRequest.httpRequestSuccessHandler = ^(NSURLSessionDataTask *task,id responseObject) {
        
        NSDictionary *jsonObject=[NSJSONSerialization
                                  JSONObjectWithData:responseObject
                                  options:NSJSONReadingMutableLeaves
                                  error:nil];
        NSArray *list = jsonObject[@"list"];
        self.weekWeatherDataSource = [EKMapper arrayOfObjectsFromExternalRepresentation:list withMapping:[ListWeather objectMapping]];
        [self.tableView reloadData];
    };
    
    httpRequest.httpRequestFailHandler = ^(NSURLSessionDataTask *_Nullable task, NSError *error) {
        UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"Network error" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [errorAlert addAction:action];
        [self presentViewController:errorAlert animated:YES completion:nil];
    };
    
    [httpRequest sendRequest];
}


#pragma mark -- search bar delegate methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self getCurrentWeatherInTheCity:searchBar.text];
    [self getWeatherOnTheWeekForCity:searchBar.text];
    searchBar.text = nil;
    [self.view endEditing:YES];
}

#pragma mark -- table view delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weekWeatherDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MXWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MXWeatherTableViewCell reuseIdentifier] forIndexPath:indexPath];
    [cell clear];
    [cell fillWithInfo:self.weekWeatherDataSource[indexPath.row] date:self.dateArray[indexPath.row]];
    return cell;
}

@end
