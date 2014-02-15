//
//  BLSocialService.h
//  API Name: Social
//
//  Created by Bennett Lee on 2/7/14.
//

#import <Foundation/Foundation.h>

@interface BLSocialService : NSObject

@property (nonatomic, strong) NSString *baseURL;

// Sets baseURL to be use for all REST API calls
- (id)initWithBaseURL:(NSString *)baseURL;

// twitterAuthentication: Request authentication via Twitter
- (void)twitterAuthenticationWithUserId:(NSNumber *)userId
				andCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// twitterCallback: Process Twitter authentication callback
- (void)twitterCallbackWithCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// twitterFriends: Retrieve Twitter Tapiture friends.
- (void)twitterFriendsWithUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// facebookAuthentication: Request authentication via Facebook.
- (void)facebookAuthenticationWithUserId:(NSNumber *)userId
				andCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// facebookCallback: Process FB authentication callback
- (void)facebookCallbackWithCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// facebookFriends: Retrieve FB Tapiture friends.
- (void)facebookFriendsWithUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// googleAuthentication: Request authentication via Google+
- (void)googleAuthenticationWithUserId:(NSNumber *)userId
				andCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// googleCallback: Process Google+ authentication callback
- (void)googleCallbackWithCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// googleFriends: Retrieve Google Tapiture friends.
- (void)googleFriendsWithUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;


@end