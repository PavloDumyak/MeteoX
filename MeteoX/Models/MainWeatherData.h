//
//  MainWeatherData.h
//  MeteoX
//
//  Created by Pavlo Dumyak on 01.06.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyMapping.h"

@interface MainWeatherData : NSObject<EKMappingProtocol>

@property(nonatomic, assign) double temp;
@property(nonatomic, assign) double pressure;
@property(nonatomic, assign) double humidity;
@property(nonatomic, assign) double temp_min;
@property(nonatomic, assign) double temp_max;

@end
