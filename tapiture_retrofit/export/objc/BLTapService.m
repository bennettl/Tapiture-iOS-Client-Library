//
//  BLTapService.m
//  API Name: Tap
//
//  Created by Bennett Lee on 2/7/14.
//

#import "BLTapService.h"
#import <AFNetworking/AFNetworking.h>
#import "NSDictionary+QueryString.h"
#import "NSString+MD5.h"

@implementation BLTapService

// Sets baseURL to be use for all REST API calls
- (id)initWithBaseURL:(NSString *)baseURL{
	if (self = [super init]){
		self.baseURL = baseURL;
	}
	return self;
}

/******** liked: Load a page of the users that liked this tap ********/ 
- (void)likedWithTapId:(NSNumber *)tapId
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
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@/liked?%@", tapId, [params queryString]];
	
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


/******** topic: Load a page of the topic's taps ********/ 
- (void)topicWithSlug:(NSString *)slug
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
    NSString *path                          = [NSString stringWithFormat:@"/tap?%@", slug, [params queryString]];
	
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


/******** featured: Load a page of featured taps, optionally filtered by type ********/ 
- (void)featuredWithStart:(NSNumber *)start
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
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/featured?%@", [params queryString]];
	
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


/******** popular: Load a page of popular taps, optionally filtered by type ********/ 
- (void)popularWithStart:(NSNumber *)start
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
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/popular?%@", [params queryString]];
	
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


/******** addComment: Create a new comment for a given tap ********/ 
- (void)addCommentWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				andMessage:(NSString *)message
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"message"	 : message
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@/comments?%@", tapId, [params queryString]];
	
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


/******** comments: Load a page of the tap's comments ********/ 
- (void)commentsWithTapId:(NSNumber *)tapId
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
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@/comments?%@", tapId, [params queryString]];
	
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


/******** like: Like a tap ********/ 
- (void)likeWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@/like?%@", tapId, [params queryString]];
	
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


/******** createTapFromFile: Create a new tap from a file ********/ 
- (void)createTapFromFileWithFile:(NSData *)file
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
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/file?%@", userId, collectionId, [params queryString]];
	
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


/******** createTapFromUrl: Create a new tap from a URL ********/ 
- (void)createTapFromUrlWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andFileType:(NSString *)fileType
				andResourceUrl:(NSString *)resourceUrl
				andSourceUrl:(NSString *)sourceUrl
				andMetadataUrl:(NSString *)metadataUrl
				andDescription:(NSString *)description
				andTitle:(NSString *)title
				andHtml:(NSString *)html
				andTapId:(NSNumber *)tapId
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
													@"tapId"	 : tapId, 
													@"visibility"	 : visibility
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/url?%@", userId, collectionId, [params queryString]];
	
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


/******** unlike: Unlike a tap ********/ 
- (void)unlikeWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@/unlike?%@", tapId, [params queryString]];
	
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


/******** retappers: Load a page of the users that have tapped this tap ********/ 
- (void)retappersWithTapId:(NSNumber *)tapId
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
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@/retappers?%@", tapId, [params queryString]];
	
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


/******** addTapTag: Add a tag to a tap ********/ 
- (void)addTapTagWithTapId:(NSNumber *)tapId
				andTagId:(NSNumber *)tagId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"tagId"	 : tagId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@/tag?%@", tapId, [params queryString]];
	
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


/******** removeTapTag: Remove a tag from a tap ********/ 
- (void)removeTapTagWithTapId:(NSNumber *)tapId
				andTagId:(NSNumber *)tagId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"tagId"	 : tagId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@/tag?%@", tapId, [params queryString]];
	
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


/******** latest: Load a page of the latest taps ********/ 
- (void)latestWithStart:(NSNumber *)start
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
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/latest?%@", [params queryString]];
	
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


/******** view: Find tap by ID ********/ 
- (void)viewWithTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = nil;
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@?%@", tapId, [params queryString]];
	
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


/******** detail: Find tap by ID viewed by a user ********/ 
- (void)detailWithTapId:(NSNumber *)tapId
				andUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@?%@", tapId, [params queryString]];
	
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


/******** delete: Delete a tap ********/ 
- (void)deleteWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@?%@", tapId, [params queryString]];
	
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


/******** update: Update a tap ********/ 
- (void)updateWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				andTitle:(NSString *)title
				andDescription:(NSString *)description
				andSourceId:(NSNumber *)sourceId
				andDestinationId:(NSNumber *)destinationId
				andVisibility:(NSString *)visibility
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"title"	 : title, 
													@"description"	 : description, 
													@"sourceId"	 : sourceId, 
													@"destinationId"	 : destinationId, 
													@"visibility"	 : visibility
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@?%@", tapId, [params queryString]];
	
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


/******** move: Move a tap from one collection to another ********/ 
- (void)moveWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				andSourceId:(NSNumber *)sourceId
				andDestinationId:(NSNumber *)destinationId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"sourceId"	 : sourceId, 
													@"destinationId"	 : destinationId
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@/move?%@", tapId, [params queryString]];
	
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


/******** report: Report a tap ********/ 
- (void)reportWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				andContext:(NSString *)context
				andReport:(NSString *)report
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"userId"	 : userId, 
													@"context"	 : context, 
													@"report"	 : report
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/tap/%@/report?%@", tapId, [params queryString]];
	
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