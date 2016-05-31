//
//  Weather.h
//  MeteoX
//
//  Created by Pavlo Dumyak on 01.06.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyMapping.h"

@interface Weather : NSObject<EKMappingProtocol>

@property(nonatomic, assign) NSInteger id;
@property(nonatomic, strong) NSString *main;
@property(nonatomic, strong) NSString *description;
@property(nonatomic, strong) NSString *icon;

@end
