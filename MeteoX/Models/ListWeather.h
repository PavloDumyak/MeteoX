//
//  List.h
//  MeteoX
//
//  Created by Pavlo Dumyak on 01.06.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyMapping.h"
#import "Weather.h"
#import "Temperature.h"

@interface ListWeather : NSObject<EKMappingProtocol>

@property(nonatomic, strong) NSArray <Weather *> *weather;
@property(nonatomic, assign) NSInteger dt;
@property(nonatomic, strong) Temperature *temp;
@property(nonatomic, assign) double pressure;
@property(nonatomic, assign) double humidity;
@property(nonatomic, assign) NSInteger clouds;
@property(nonatomic, assign) double rain;
@property(nonatomic, assign) double speed;

@end
