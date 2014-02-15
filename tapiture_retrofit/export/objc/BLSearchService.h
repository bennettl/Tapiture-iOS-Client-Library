//
//  BLSearchService.h
//  API Name: Search
//
//  Created by Bennett Lee on 2/7/14.
//

#import <Foundation/Foundation.h>

@interface BLSearchService : NSObject

@property (nonatomic, strong) NSString *baseURL;

// Sets baseURL to be use for all REST API calls
- (id)initWithBaseURL:(NSString *)baseURL;

// simpleQuery: Search for a specific object type containing a given term
- (void)simpleQueryWithType:(NSString *)type
				andQuery:(NSString *)query
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;


@end