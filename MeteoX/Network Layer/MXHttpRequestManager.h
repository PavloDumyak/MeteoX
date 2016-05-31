//
//  MXHttpRequestManager.h
//  MeteoX
//
//  Created by Pavlo Dumyak on 31.05.16.
//  Copyright © 2016 PavloDumyak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HttpRequestType) {
    HttpRequestTypeGet,
    HttpRequestTypePost,
    HttpRequestTypePut,
    HttpRequestTypeDelete
};

typedef void (^HttpRequestSuccessHandler)(NSURLSessionDataTask *task, id responseObject);
typedef void (^HttpRequestFailHandler)(NSURLSessionDataTask *_Nullable task, NSError *error);

@interface MXHttpRequestManager : NSObject

@property (nonatomic, copy) NSString *link;
@property (nonatomic, assign) HttpRequestType type;
@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, strong) NSString *tokenType;
@property (nonatomic, copy, nullable) HttpRequestSuccessHandler httpRequestSuccessHandler;
@property (nonatomic, copy, nullable) HttpRequestFailHandler httpRequestFailHandler;

- (instancetype)initWithLink:(NSString *)link;
- (instancetype)initWithLink:(NSString *)link ofType:(HttpRequestType)type withParams:(nullable NSDictionary *)params;

- (void)sendRequest;

@end

NS_ASSUME_NONNULL_END
