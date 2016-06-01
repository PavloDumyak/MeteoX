//
//  MXWeatherTableViewCell.h
//  MeteoX
//
//  Created by Pavlo Dumyak on 01.06.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListWeather.h"
#import "MXCommon.h"

typedef NS_ENUM(NSUInteger, MXBackgroundColorType) {
    MXClearSky,
    MXFewClouds,
    MXScatteredClouds,
    MXBrokenClouds,
    MXShowerRain,
    MXRain,
    MXThunderstorm,
    MXSnow,
    MXMist
};

@interface MXWeatherTableViewCell : UITableViewCell

@property(weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property(weak, nonatomic) IBOutlet UILabel *weatherStatusLabel;
@property(weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property(weak, nonatomic) IBOutlet UILabel *dateLabel;

@property(nonatomic, assign) MXBackgroundColorType colorType;

+ (NSString *)reuseIdentifier;

- (void)fillWithInfo:(ListWeather *)info date:(NSString *)date;
- (void)clear;

@end
