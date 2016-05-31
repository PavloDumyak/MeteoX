//
//  MXHttpRequestManager.m
//  MeteoX
//
//  Created by Pavlo Dumyak on 31.05.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import "MXHttpRequestManager.h"
#import "AFNetworking.h"
#import "MXNetworkConstants.h"

@interface MXHttpRequestManager ()

@property(nonatomic, strong) AFHTTPSessionManager *httpManager;

@end

@implementation MXHttpRequestManager

- (instancetype)initWithLink:(NSString *)link {
    return [self initWithLink:link ofType:HttpRequestTypeGet withParams:nil];
}

- (instancetype)initWithLink:(NSString *)link ofType:(HttpRequestType)type withParams:(nullable NSDictionary *)params {
    self = [super init];
    if (self) {
        self.link = [link stringByAppendingString:mAppID];
        self.type = type;
        self.params = params;
        self.httpManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:mBaseURL]];
        self.httpManager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.httpManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}

- (void)sendRequest {
    switch (self.type) {
        case HttpRequestTypeGet:
            [self.httpManager GET:self.link
                       parameters:self.params
                         progress:nil
                          success:self.httpRequestSuccessHandler
                          failure:self.httpRequestFailHandler];
            break;
        case HttpRequestTypePost:
            [self.httpManager POST:self.link
                        parameters:self.params
                          progress:nil
                           success:self.httpRequestSuccessHandler
                           failure:self.httpRequestFailHandler];
            break;
        case HttpRequestTypePut:
            [self.httpManager PUT:self.link
                       parameters:self.params
                          success:self.httpRequestSuccessHandler
                          failure:self.httpRequestFailHandler];
            break;
        case HttpRequestTypeDelete:
            [self.httpManager DELETE:self.link
                          parameters:self.params
                             success:self.httpRequestSuccessHandler
                             failure:self.httpRequestFailHandler];
            break;
        default:
            break;
    }
}

@end
