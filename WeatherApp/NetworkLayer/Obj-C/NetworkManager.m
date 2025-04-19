//
//  NetworkManager.m
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

#import "NetworkManager.h"
#import "Reachability.h"

@implementation NetworkManager

- (BOOL)isNetworkReachable {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reachability currentReachabilityStatus];
    return status != NotReachable;
}

- (NSURLRequest *)requestWithURL:(NSString *)urlString
                      httpMethod:(NSString *)httpMethod
                      parameters:(nullable NSDictionary *)parameters
                          header:(nullable NSDictionary<NSString *, NSString *> *)header {
    
    // Ensure valid URL creation
    NSURL *url = [NSURL URLWithString:urlString];
    if (!url) {
        NSLog(@"❌ Invalid URL: %@", urlString);
        return nil;
    }

    // Initialize URL components
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Add query parameters for GET requests
    if ([httpMethod isEqualToString:@"GET"] && parameters) {
        NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray array];
        for (NSString *key in parameters) {
            NSString *value = parameters[key];
            if (key && value) {
                NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:key value:value];
                [queryItems addObject:queryItem];
            }
        }
        components.queryItems = queryItems;
    }

    // Create the request with the final URL
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:components.URL];
    request.HTTPMethod = httpMethod.uppercaseString;

    // If the method is not GET, add the parameters as the request body (for POST/PUT)
    if (![httpMethod isEqualToString:@"GET"] && parameters) {
        NSError *jsonError;
        NSData *jsonBody = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"❌ Failed to serialize parameters to JSON: %@", jsonError.localizedDescription);
            return nil;
        }
        request.HTTPBody = jsonBody;
    }

    // Add default headers if not set in the provided `header` dictionary
    if (![header objectForKey:@"Content-Type"]) {
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    if (![header objectForKey:@"Accept"]) {
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    }

    // Add any additional headers passed in
    for (NSString *key in header) {
        [request setValue:header[key] forHTTPHeaderField:key];
    }

    return request;
}

- (void)executeAPICallWithURL:(NSString *)urlString
                   httpMethod:(NSString *)httpMethod
                   parameters:(NSDictionary *)parameters
                       header:(NSDictionary<NSString *,NSString *> *)header
               successHandler:(JSONSuccessHandler)success
               failureHandler:(FailureHandler)failure {
    
    if (![self isNetworkReachable]) {
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain
                                             code:NSURLErrorNotConnectedToInternet
                                         userInfo:nil];
        failure(error);
        return;
    }
    
    NSURLRequest *request = [self requestWithURL:urlString
                                      httpMethod:httpMethod
                                      parameters:parameters
                                          header:header];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession]
                                  dataTaskWithRequest:request
                                  completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            failure(error);
            return;
        }
        
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError || ![json isKindOfClass:[NSDictionary class]]) {
            NSError *responseError = jsonError ?: [NSError errorWithDomain:@"NetworkManager"
                                                                      code:1001
                                                                  userInfo:@{NSLocalizedDescriptionKey: @"Invalid JSON response"}];
            
            failure(responseError);
            return;
        }
        
        success(json);
        
    }];
    
    [task resume];
}

@end
