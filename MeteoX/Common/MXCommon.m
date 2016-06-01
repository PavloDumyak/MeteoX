//
//  MXCommon.m
//  MeteoX
//
//  Created by Pavlo Dumyak on 01.06.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import "MXCommon.h"

@implementation MXCommon

+ (NSString *)getCurrentDate {
    NSString *stringDate;
    NSDate *date = [NSDate new];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:MM dd"];
    stringDate = [formatter stringFromDate:date];
    stringDate = [stringDate stringByAppendingString:@" of "];
    [formatter setDateFormat:@"MMMM"];
    stringDate = [stringDate stringByAppendingString:[formatter stringFromDate:date]];
    return stringDate;
}

+ (NSMutableArray *)getDateForAllWeek {
    NSMutableArray *arrayWithDates = [NSMutableArray new];
    for (NSInteger i = 0; i < 7; i++) {
        NSString *stringDate;
        NSDate *date = [NSDate dateWithTimeInterval:(24*60*60)*i sinceDate:[NSDate date]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:MM dd"];
        stringDate = [formatter stringFromDate:date];
        stringDate = [stringDate stringByAppendingString:@" of "];
        [formatter setDateFormat:@"MMMM"];
        stringDate = [stringDate stringByAppendingString:[formatter stringFromDate:date]];
        [arrayWithDates addObject:stringDate];
    }
    return arrayWithDates;
}

+ (double)convertToCelcius:(double)farenheit {
    return 300 - farenheit;
}

@end
