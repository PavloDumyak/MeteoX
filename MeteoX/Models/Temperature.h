//
//  Temperature.h
//  MeteoX
//
//  Created by Pavlo Dumyak on 01.06.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyMapping.h"

@interface Temperature : NSObject<EKMappingProtocol>

@property(nonatomic, assign) double day;
@property(nonatomic, assign) double min;
@property(nonatomic, assign) double max;
@property(nonatomic, assign) double night;
@property(nonatomic, assign) double eve;
@property(nonatomic, assign) double morn;

@end
