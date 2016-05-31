//
//  MXNetworkConstants.h
//  MeteoX
//
//  Created by Pavlo Dumyak on 31/05/16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#ifndef MXNetworkConstants_h
#define MXNetworkConstants_h

// REST API

static NSString *const mBaseURL = @"http://api.openweathermap.org/";

static NSString *const mWeatherByCityNameURL = @"/data/2.5/weather?q=%@";
static NSString *const mWeatheForAFiveDayURL =  @"data/2.5/forecast?q=%@,ua";

#endif /* MXNetworkConstants_h */
