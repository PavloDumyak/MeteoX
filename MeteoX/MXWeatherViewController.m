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

@interface MXWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *skyTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIView *weatherPlaceholderView;

@property (nonatomic, strong) CurrentWeather *currentWeather;

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
}

- (void)setupUI {
    self.weatherPlaceholderView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
    self.searchBar.delegate = self;
    self.cityLabel.text = self.currentWeather.name;
    self.dateLabel.text = [self getCurrentDate];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%.1f", [self convertToCelcius:self.currentWeather.main.temp]];
    self.skyTypeLabel.text = self.currentWeather.weather[0].detail.capitalizedString;
}

- (double)convertToCelcius:(double)farenheit {
    return 300 - farenheit;
}

- (NSString *)getCurrentDate {
    NSString *stringDate;
    NSDate *date = [NSDate new];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:MM dd"];
    stringDate = [formatter stringFromDate:date];
    stringDate = [stringDate stringByAppendingString:@" of "];
    [formatter setDateFormat:@"MMMM"];
    stringDate = [stringDate stringByAppendingString:[formatter stringFromDate:date]];
    return stringDate;
}

#pragma mark -- http request

- (void)getCurrentWeatherInTheCity:(NSString *)city {
    
    NSString *formatedUrl = [NSString stringWithFormat:mWeatherByCityNameURL,city];
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


#pragma mark -- search bar delegate methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self getCurrentWeatherInTheCity:searchBar.text];
    [self.view endEditing:YES];
}


@end
