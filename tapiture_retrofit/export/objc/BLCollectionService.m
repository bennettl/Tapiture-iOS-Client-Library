//
//  BLCollectionService.m
//  API Name: Collection
//
//  Created by Bennett Lee on 2/7/14.
//

#import "BLCollectionService.h"
#import <AFNetworking/AFNetworking.h>
#import "NSDictionary+QueryString.h"
#import "NSString+MD5.h"

@implementation BLCollectionService

// Sets baseURL to be use for all REST API calls
- (id)initWithBaseURL:(NSString *)baseURL{
	if (self = [super init]){
		self.baseURL = baseURL;
	}
	return self;
}

/******** followers: Load page of a collection's followers ********/ 
- (void)followersWithCollectionId:(NSNumber *)collectionId
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
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@/followers?%@", collectionId, [params queryString]];
	
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


/******** taps: Load page of a collection's taps ********/ 
- (void)tapsWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"start"	 : start, 
													@"count"	 : count, 
													@"filter"	 : filter
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@/taps?%@", collectionId, [params queryString]];
	
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


/******** removeTap: Delete a tap from a user's collection ********/ 
- (void)removeTapWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"tapId"	 : tapId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@/taps?%@", collectionId, [params queryString]];
	
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


/******** latestTaps: Load a page of the latest taps ********/ 
- (void)latestTapsWithCollectionId:(NSNumber *)collectionId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"collectionId"	 : collectionId, 
													@"start"	 : start, 
													@"count"	 : count, 
													@"filter"	 : filter
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/latest?%@", [params queryString]];
	
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


/******** popularTaps: Load a page of popular taps, optionally filtered by type ********/ 
- (void)popularTapsWithCollectionId:(NSNumber *)collectionId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"collectionId"	 : collectionId, 
													@"start"	 : start, 
													@"count"	 : count, 
													@"filter"	 : filter
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/popular?%@", [params queryString]];
	
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


/******** featuredTaps: Load a page of featured taps ********/ 
- (void)featuredTapsWithCollectionId:(NSNumber *)collectionId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"collectionId"	 : collectionId, 
													@"start"	 : start, 
													@"count"	 : count, 
													@"filter"	 : filter
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/featured?%@", [params queryString]];
	
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


/******** reorder: Update a collection's tap order ********/ 
- (void)reorderWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andOrdering:(NSString *)ordering
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"ordering"	 : ordering
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@/reorder?%@", collectionId, [params queryString]];
	
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


/******** unfollow: Unfollow a collection ********/ 
- (void)unfollowWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@/unfollow?%@", collectionId, [params queryString]];
	
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


/******** topicTaps: Load a page of the topic's featured taps. ********/ 
- (void)topicTapsWithUserId:(NSNumber *)userId
				andSlug:(NSString *)slug
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"start"	 : start, 
													@"count"	 : count, 
													@"filter"	 : filter
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/topic/%@?%@", slug, [params queryString]];
	
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


/******** allTopicTaps: Load a page of all of the topic's taps ********/ 
- (void)allTopicTapsWithUserId:(NSNumber *)userId
				andSlug:(NSString *)slug
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"start"	 : start, 
													@"count"	 : count, 
													@"filter"	 : filter
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/topic/%@/all?%@", slug, [params queryString]];
	
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


/******** topics: List all topics ********/ 
- (void)topicsWithsuccess:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = nil;
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/topics"];;
	
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


/******** topicPreviews: List all topics with thumbnails ********/ 
- (void)topicPreviewsWithUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/topicPreviews?%@", [params queryString]];
	
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


/******** addCollectionTag: Add a tag to a collection ********/ 
- (void)addCollectionTagWithCollectionId:(NSNumber *)collectionId
				andTagId:(NSNumber *)tagId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"tagId"	 : tagId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@/tag?%@", collectionId, [params queryString]];
	
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


/******** removeCollectionTag: Remove a tag from a collection ********/ 
- (void)removeCollectionTagWithCollectionId:(NSNumber *)collectionId
				andTagId:(NSNumber *)tagId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"tagId"	 : tagId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@/tag?%@", collectionId, [params queryString]];
	
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


/******** view: Find tap collection by ID ********/ 
- (void)viewWithCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = nil;
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@?%@", collectionId, [params queryString]];
	
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


/******** view: Find tap collection by ID ********/ 
- (void)viewWithCollectionId:(NSNumber *)collectionId
				andUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@?%@", collectionId, [params queryString]];
	
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


/******** remove: Remove a user's collection ********/ 
- (void)removeWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@?%@", collectionId, [params queryString]];
	
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


/******** update: Update a collection ********/ 
- (void)updateWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andName:(NSString *)name
				andTopicId:(NSNumber *)topicId
				andVisibility:(NSString *)visibility
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"name"	 : name, 
													@"topicId"	 : topicId, 
													@"visibility"	 : visibility
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@?%@", collectionId, [params queryString]];
	
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


/******** follow: Follow a collection ********/ 
- (void)followWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection/%@/follow?%@", collectionId, [params queryString]];
	
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


/******** create: Create a new collection ********/ 
- (void)createWithUserId:(NSNumber *)userId
				andTitle:(NSString *)title
				andTopicId:(NSNumber *)topicId
				andVisibility:(NSString *)visibility
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"title"	 : title, 
													@"topicId"	 : topicId, 
													@"visibility"	 : visibility
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/collection?%@", [params queryString]];
	
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