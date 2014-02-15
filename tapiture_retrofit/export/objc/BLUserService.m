//
//  BLUserService.m
//  API Name: User
//
//  Created by Bennett Lee on 2/7/14.
//

#import "BLUserService.h"
#import <AFNetworking/AFNetworking.h>
#import "NSDictionary+QueryString.h"
#import "NSString+MD5.h"

@implementation BLUserService

// Sets baseURL to be use for all REST API calls
- (id)initWithBaseURL:(NSString *)baseURL{
	if (self = [super init]){
		self.baseURL = baseURL;
	}
	return self;
}

/******** logout: Terminate user session ********/ 
- (void)logoutWithsuccess:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = nil;
    NSString *path                          = [NSString stringWithFormat:@"/api/user/logout"];;
	
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


/******** createCollection: Create a new collection ********/ 
- (void)createCollectionWithUserId:(NSNumber *)userId
				andTitle:(NSString *)title
				andTopicId:(NSNumber *)topicId
				andVisibility:(NSString *)visibility
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"title"	 : title, 
													@"topicId"	 : topicId, 
													@"visibility"	 : visibility
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/collections?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** collections: Load a page of the user's collections ********/ 
- (void)collectionsWithVisitorId:(NSNumber *)visitorId
				andUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"visitorId"	 : visitorId, 
													@"start"	 : start, 
													@"count"	 : count
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/collections?%@", userId, [params queryString]];
	
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


/******** removeCollection: Remove a collection ********/ 
- (void)removeCollectionWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"collectionId"	 : collectionId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/collections?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager DELETE:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** likes: Load a page of the user's likes ********/ 
- (void)likesWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"start"	 : start, 
													@"count"	 : count, 
													@"filter"	 : filter
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/likes?%@", userId, [params queryString]];
	
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


/******** likeTap: Like a tap ********/ 
- (void)likeTapWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"tapId"	 : tapId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/likes?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager PUT:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** unlikeTap: Unlike a tap ********/ 
- (void)unlikeTapWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"tapId"	 : tapId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/likes?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager DELETE:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** followedUsers: Load a page of users the user is following ********/ 
- (void)followedUsersWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"start"	 : start, 
													@"count"	 : count
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/following/users?%@", userId, [params queryString]];
	
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


/******** followUser: Follow a user ********/ 
- (void)followUserWithUserId:(NSNumber *)userId
				andFollowedId:(NSNumber *)followedId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"followedId"	 : followedId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/following/users?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager PUT:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** unfollowUser: Unfollow a user ********/ 
- (void)unfollowUserWithUserId:(NSNumber *)userId
				andFollowedId:(NSNumber *)followedId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"followedId"	 : followedId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/following/users?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager DELETE:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** activities: Load a page of the user's actvity stream ********/ 
- (void)activitiesWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"start"	 : start, 
													@"count"	 : count
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/activities?%@", userId, [params queryString]];
	
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


/******** markActivitiesRead: Mark all activities in a date range as having been read. ********/ 
- (void)markActivitiesReadWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"start"	 : start, 
													@"count"	 : count
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/activities?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager PUT:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** followCollection: Follow a collection ********/ 
- (void)followCollectionWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"collectionId"	 : collectionId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/following/collections?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager PUT:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** unfollowCollection: Unfollow a collection ********/ 
- (void)unfollowCollectionWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"collectionId"	 : collectionId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/following/collections?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager DELETE:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** followedCollections: Load a page of collections the user is following ********/ 
- (void)followedCollectionsWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"start"	 : start, 
													@"count"	 : count
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/following/collections?%@", userId, [params queryString]];
	
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


/******** updateProfile: Update a user's profile. ********/ 
- (void)updateProfileWithUserId:(NSNumber *)userId
				andEmail:(NSString *)email
				andDisplayName:(NSString *)displayName
				andLocation:(NSString *)location
				andBio:(NSString *)bio
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"email"	 : email, 
													@"displayName"	 : displayName, 
													@"location"	 : location, 
													@"bio"	 : bio
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/update?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager PUT:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** followers: Load a page of the user's followers ********/ 
- (void)followersWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"start"	 : start, 
													@"count"	 : count
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/followers?%@", userId, [params queryString]];
	
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


/******** addTap: Add an existing tap to a user's collection ********/ 
- (void)addTapWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andTapId:(NSNumber *)tapId
				andTitle:(NSString *)title
				andDescription:(NSString *)description
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"tapId"	 : tapId, 
													@"title"	 : title, 
													@"description"	 : description
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/collections/%@?%@", userId, collectionId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager PUT:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** removeTap: Remove a tap from a user's collection ********/ 
- (void)removeTapWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"tapId"	 : tapId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/collections/%@?%@", userId, collectionId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager DELETE:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** taps: Load a page of the user's taps ********/ 
- (void)tapsWithVisitorId:(NSNumber *)visitorId
				andUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"visitorId"	 : visitorId, 
													@"start"	 : start, 
													@"count"	 : count, 
													@"filter"	 : filter
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/taps?%@", userId, [params queryString]];
	
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


/******** moveTap: Move a tap from one collection to another ********/ 
- (void)moveTapWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				andSourceId:(NSNumber *)sourceId
				andDestinationId:(NSNumber *)destinationId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"sourceId"	 : sourceId, 
													@"destinationId"	 : destinationId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/taps/%@/move?%@", userId, tapId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager PUT:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** requestPasswordReset: Request a password reset ********/ 
- (void)requestPasswordResetWithEmail:(NSString *)email
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"email"	 : email
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/reset?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** timeline: Load a page of the user's timeline ********/ 
- (void)timelineWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"start"	 : start, 
													@"count"	 : count
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/timeline?%@", userId, [params queryString]];
	
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


/******** collectionsList: Load a compact page of the user's collections ********/ 
- (void)collectionsListWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andOrder:(NSString *)order
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"start"	 : start, 
													@"count"	 : count, 
													@"order"	 : order
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/collectionsList?%@", userId, [params queryString]];
	
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


/******** feed: Load a page from the user's feed ********/ 
- (void)feedWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"start"	 : start, 
													@"count"	 : count, 
													@"filter"	 : filter
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/feed?%@", userId, [params queryString]];
	
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


/******** updateAvatarWithFile: Set the user's avatar from a file ********/ 
- (void)updateAvatarWithFileWithFile:(NSData *)file
				andUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = nil;
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/avatar/file?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
NSString *randomString = [NSString genRandStringLength:25];
		[formData appendPartWithFileData:file name:randomString fileName:[NSString stringWithFormat:@"%@.png", randomString] mimeType:@"application/octet-stream"];	} success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		failureBlock(error);
	}];

}


/******** updateAvatarWithUrl: Set the user's avatar from a url ********/ 
- (void)updateAvatarWithUrlWithUserId:(NSNumber *)userId
				andFileType:(NSString *)fileType
				andResourceUrl:(NSString *)resourceUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"fileType"	 : fileType, 
													@"resourceUrl"	 : resourceUrl
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/avatar/url?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** updateBannerWithFile: Set the user's banner from a file ********/ 
- (void)updateBannerWithFileWithFile:(NSData *)file
				andUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = nil;
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/banner/file?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
NSString *randomString = [NSString genRandStringLength:25];
		[formData appendPartWithFileData:file name:randomString fileName:[NSString stringWithFormat:@"%@.png", randomString] mimeType:@"application/octet-stream"];	} success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		failureBlock(error);
	}];

}


/******** updateBannerWithUrl: Set the user's banner from a url ********/ 
- (void)updateBannerWithUrlWithUserId:(NSNumber *)userId
				andFileType:(NSString *)fileType
				andResourceUrl:(NSString *)resourceUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"fileType"	 : fileType, 
													@"resourceUrl"	 : resourceUrl
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/banner/url?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** createUrlTap: Create a new tap from a url ********/ 
- (void)createUrlTapWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andFileType:(NSString *)fileType
				andResourceUrl:(NSString *)resourceUrl
				andSourceUrl:(NSString *)sourceUrl
				andMetadataUrl:(NSString *)metadataUrl
				andDescription:(NSString *)description
				andTitle:(NSString *)title
				andHtml:(NSString *)html
				andVisibility:(NSString *)visibility
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"fileType"	 : fileType, 
													@"resourceUrl"	 : resourceUrl, 
													@"sourceUrl"	 : sourceUrl, 
													@"metadataUrl"	 : metadataUrl, 
													@"description"	 : description, 
													@"title"	 : title, 
													@"html"	 : html, 
													@"visibility"	 : visibility
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/collections/%@/url?%@", userId, collectionId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** createFileTap: Create a new tap from a file ********/ 
- (void)createFileTapWithFile:(NSData *)file
				andDescription:(NSString *)description
				andTitle:(NSString *)title
				andVisibility:(NSString *)visibility
				andUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = nil;
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/collections/%@/file?%@", userId, collectionId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
NSString *randomString = [NSString genRandStringLength:25];
		[formData appendPartWithFileData:file name:randomString fileName:[NSString stringWithFormat:@"%@.png", randomString] mimeType:@"application/octet-stream"];	} success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		failureBlock(error);
	}];

}


/******** login: Login with username and password ********/ 
- (void)loginWithUsername:(NSString *)username
				andPassword:(NSString *)password
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"username"	 : username, 
													@"password"	 : [password MD5String]
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/login?%@", [params queryString]];
	
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


/******** refreshSession: Refresh a user's session ********/ 
- (void)refreshSessionWithsuccess:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = nil;
    NSString *path                          = [NSString stringWithFormat:@"/api/user/session"];;
	
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


/******** lookupResetPasswordToken: Lookup reset password token ********/ 
- (void)lookupResetPasswordTokenWithToken:(NSString *)token
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"token"	 : token
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/reset/token?%@", [params queryString]];
	
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


/******** setPassword: Set new user password ********/ 
- (void)setPasswordWithUserId:(NSNumber *)userId
				andToken:(NSString *)token
				andPassword1:(NSString *)password1
				andPassword2:(NSString *)password2
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"token"	 : token, 
													@"password1"	 : [password1 MD5String], 
													@"password2"	 : [password2 MD5String]
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/password?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager PUT:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


/******** view: Find user by ID ********/ 
- (void)viewWithUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = nil;
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@?%@", userId, [params queryString]];
	
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


/******** profile: Load a user's profile ********/ 
- (void)profileWithUserId:(NSNumber *)userId
				andVisitorId:(NSNumber *)visitorId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"visitorId"	 : visitorId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/profile?%@", userId, [params queryString]];
	
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


/******** register: Register a new user ********/ 
- (void)registerWithUsername:(NSString *)username
				andEmail:(NSString *)email
				andPassword:(NSString *)password
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"username"	 : username, 
													@"email"	 : email, 
													@"password"	 : [password MD5String]
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user?%@", [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}


@end