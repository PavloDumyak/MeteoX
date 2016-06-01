//
//  MXWeatherTableViewCell.m
//  MeteoX
//
//  Created by Pavlo Dumyak on 01.06.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import "MXWeatherTableViewCell.h"
#import "MXNetworkConstants.h"

@implementation MXWeatherTableViewCell

+(NSString *)reuseIdentifier {
    return @"MXWeatherTableViewCellIdentifier";
}

- (void)fillWithInfo:(ListWeather *)info date:(NSString *)date {
    
    self.colorType = MXRain;
    [self setBackgroundColor];
    
    self.dateLabel.text = date;
    self.temperatureLabel.text = [NSString stringWithFormat:@"t = %.1f", info.temp.day];
    self.weatherStatusLabel.text = info.weather[0].detail.capitalizedString;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^(void) {
        NSString *currentImageUrl = imageURL;
        currentImageUrl = [currentImageUrl stringByAppendingString:[NSString stringWithFormat:@"%@.png", info.weather[0].icon]];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:currentImageUrl]];
                             UIImage* image = [[UIImage alloc] initWithData:imageData];
                             if (image) {
                                 dispatch_async(dispatch_get_main_queue(), ^{
                                     self.weatherImageView.image = image;
                                 });
                             }
                        });
}

- (void)clear {
    self.dateLabel.text = nil;
    self.weatherStatusLabel.text = nil;
    self.temperatureLabel.text = nil;
}


- (void)setBackgroundColor {
    switch (self.colorType) {
        case MXClearSky:
            self.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
            break;
        case MXFewClouds:
            self.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
            break;
        case MXScatteredClouds:
            self.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
            break;
        case MXBrokenClouds:
            self.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
            break;
        case MXShowerRain:
            self.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
            break;
        case MXThunderstorm:
            self.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
            break;
        case MXSnow:
            self.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
            break;
        case MXMist:
            self.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
            break;
        case MXRain:
            self.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:107.0/255.0 blue:1/255 alpha:1];
            break;
        default:
            break;
    }
}

@end
