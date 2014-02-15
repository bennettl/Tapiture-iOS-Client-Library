//
//  BLTapService.h
//  API Name: Tap
//
//  Created by Bennett Lee on 2/7/14.
//

#import <Foundation/Foundation.h>

@interface BLTapService : NSObject

@property (nonatomic, strong) NSString *baseURL;

// Sets baseURL to be use for all REST API calls
- (id)initWithBaseURL:(NSString *)baseURL;

// liked: Load a page of the users that liked this tap
- (void)likedWithTapId:(NSNumber *)tapId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// topic: Load a page of the topic's taps
- (void)topicWithSlug:(NSString *)slug
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// featured: Load a page of featured taps, optionally filtered by type
- (void)featuredWithStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// popular: Load a page of popular taps, optionally filtered by type
- (void)popularWithStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// addComment: Create a new comment for a given tap
- (void)addCommentWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				andMessage:(NSString *)message
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// comments: Load a page of the tap's comments
- (void)commentsWithTapId:(NSNumber *)tapId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// like: Like a tap
- (void)likeWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// createTapFromFile: Create a new tap from a file
- (void)createTapFromFileWithFile:(NSData *)file
				andDescription:(NSString *)description
				andTitle:(NSString *)title
				andVisibility:(NSString *)visibility
				andUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// createTapFromUrl: Create a new tap from a URL
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
				failure:(void (^)(NSError *error))failureBlock;

// unlike: Unlike a tap
- (void)unlikeWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// retappers: Load a page of the users that have tapped this tap
- (void)retappersWithTapId:(NSNumber *)tapId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// addTapTag: Add a tag to a tap
- (void)addTapTagWithTapId:(NSNumber *)tapId
				andTagId:(NSNumber *)tagId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// removeTapTag: Remove a tag from a tap
- (void)removeTapTagWithTapId:(NSNumber *)tapId
				andTagId:(NSNumber *)tagId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// latest: Load a page of the latest taps
- (void)latestWithStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// view: Find tap by ID
- (void)viewWithTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// detail: Find tap by ID viewed by a user
- (void)detailWithTapId:(NSNumber *)tapId
				andUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// delete: Delete a tap
- (void)deleteWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// update: Update a tap
- (void)updateWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				andTitle:(NSString *)title
				andDescription:(NSString *)description
				andSourceId:(NSNumber *)sourceId
				andDestinationId:(NSNumber *)destinationId
				andVisibility:(NSString *)visibility
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// move: Move a tap from one collection to another
- (void)moveWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				andSourceId:(NSNumber *)sourceId
				andDestinationId:(NSNumber *)destinationId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// report: Report a tap
- (void)reportWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				andContext:(NSString *)context
				andReport:(NSString *)report
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;


@end