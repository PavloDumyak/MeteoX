//
//  MXNetworkConstants.h
//  MeteoX
//
//  Created by Pavlo Dumyak on 31.05.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#ifndef MXNetworkConstants_h
#define MXNetworkConstants_h

// REST API

static NSString *const mBaseURL = @"http://api.openweathermap.org/";
static NSString *const mAppID = @"&appid=a575ffe0b2c85312ed4186cbb0392aa8";

static NSString *const mWeatherByCityNameURL = @"/data/2.5/weather?q=%@";
static NSString *const mWeatherForASixteenDayURL = @"data/2.5/forecast/daily?q=%@&mode=json&units=metric&cnt=7";

static NSString *const imageURL = @"http://openweathermap.org/img/w/";

#endif /* MXNetworkConstants_h */