//
//  CurrentWeather.h
//  MeteoX
//
//  Created by Pavlo Dumyak on 31.05.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyMapping.h"
#import "Weather.h"
#import "MainWeatherData.h"

@interface CurrentWeather : NSObject<EKMappingProtocol>

@property(nonatomic, strong) Weather *weather;
@property(nonatomic, strong) MainWeatherData *main;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger id;
@property(nonatomic, assign) NSInteger code;

@end


