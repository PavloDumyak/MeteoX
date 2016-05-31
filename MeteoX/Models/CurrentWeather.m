//
//  CurrentWeather.m
//  MeteoX
//
//  Created by Pavlo Dumyak on 31.05.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import "CurrentWeather.h"

@implementation CurrentWeather

+ (EKObjectMapping *)objectMapping
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping hasMany:[Weather class] forKeyPath:@"weather"];
        [mapping hasOne:[MainWeatherData class] forKeyPath:@"main"];
        [mapping mapPropertiesFromArray:@[@"name",@"id",@"code"]];
    }];
}

@end



