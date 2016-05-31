//
//  MainWeatherData.m
//  MeteoX
//
//  Created by Pavlo Dumyak on 01.06.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import "MainWeatherData.h"

@implementation MainWeatherData

+ (EKObjectMapping *)objectMapping
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"temp",@"pressure",@"humidity", @"temp_min", @"temp_max"]];
    }];
}

@end
