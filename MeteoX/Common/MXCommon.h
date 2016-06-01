//
//  MXCommon.h
//  MeteoX
//
//  Created by Pavlo Dumyak on 01.06.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXCommon : NSObject

+ (NSString *)getCurrentDate;
+ (double)convertToCelcius:(double)farenheit;
+ (NSMutableArray *)getDateForAllWeek;

@end
