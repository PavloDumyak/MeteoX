//
//  List.m
//  MeteoX
//
//  Created by Pavlo Dumyak on 01.06.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import "ListWeather.h"

@implementation ListWeather

+ (EKObjectMapping *)objectMapping
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"rain",@"speed",@"clouds",@"pressure",@"humidity",@"dt"]];
        [mapping hasMany:[Weather class] forKeyPath:@"weather"];
        [mapping hasOne:[Temperature class] forKeyPath:@"temp"];
    }];
}

@end
