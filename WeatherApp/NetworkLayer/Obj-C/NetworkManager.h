//
//  NetworkManager.h
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^JSONSuccessHandler)(NSDictionary *json);
typedef void(^FailureHandler)(NSError *error);

@interface NetworkManager : NSObject

// JSON response
- (void)executeAPICallWithURL:(NSString *)urlString
                   httpMethod:(NSString *)httpMethod
                   parameters:(nullable NSDictionary *)parameters
                       header:(nullable NSDictionary<NSString *, NSString *> *)header
               successHandler:(JSONSuccessHandler)success
               failureHandler:(FailureHandler)failure;

@end

NS_ASSUME_NONNULL_END
