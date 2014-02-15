//
//  BLSocialService.m
//  API Name: Social
//
//  Created by Bennett Lee on 2/7/14.
//

#import "BLSocialService.h"
#import <AFNetworking/AFNetworking.h>
#import "NSDictionary+QueryString.h"
#import "NSString+MD5.h"

@implementation BLSocialService

// Sets baseURL to be use for all REST API calls
- (id)initWithBaseURL:(NSString *)baseURL{
	if (self = [super init]){
		self.baseURL = baseURL;
	}
	return self;
}

/******** twitterAuthentication: Request authentication via Twitter ********/ 
- (void)twitterAuthenticationWithUserId:(NSNumber *)userId
				andCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"callbackUrl"	 : callbackUrl
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/social/auth/twitter?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** twitterCallback: Process Twitter authentication callback ********/ 
- (void)twitterCallbackWithCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"callbackUrl"	 : callbackUrl
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/social/login/twitter?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** twitterFriends: Retrieve Twitter Tapiture friends. ********/ 
- (void)twitterFriendsWithUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/social/friends/twitter?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** facebookAuthentication: Request authentication via Facebook. ********/ 
- (void)facebookAuthenticationWithUserId:(NSNumber *)userId
				andCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"callbackUrl"	 : callbackUrl
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/social/auth/fb?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** facebookCallback: Process FB authentication callback ********/ 
- (void)facebookCallbackWithCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"callbackUrl"	 : callbackUrl
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/social/login/fb?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** facebookFriends: Retrieve FB Tapiture friends. ********/ 
- (void)facebookFriendsWithUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/social/friends/fb?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** googleAuthentication: Request authentication via Google+ ********/ 
- (void)googleAuthenticationWithUserId:(NSNumber *)userId
				andCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"callbackUrl"	 : callbackUrl
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/social/auth/google?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** googleCallback: Process Google+ authentication callback ********/ 
- (void)googleCallbackWithCallbackUrl:(NSString *)callbackUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"callbackUrl"	 : callbackUrl
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/social/login/google?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** googleFriends: Retrieve Google Tapiture friends. ********/ 
- (void)googleFriendsWithUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/social/friends/google?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


@end