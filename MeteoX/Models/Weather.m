//
//  Weather.m
//  MeteoX
//
//  Created by Pavlo Dumyak on 01.06.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import "Weather.h"

@implementation Weather

+ (EKObjectMapping *)objectMapping
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"id",@"main", @"icon"]];
        [mapping mapPropertiesFromDictionary:@{@"description":@"detail"}];
    }];
}

@end
