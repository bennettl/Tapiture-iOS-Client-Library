//
//  BLCollectionService.h
//  API Name: Collection
//
//  Created by Bennett Lee on 2/7/14.
//

#import <Foundation/Foundation.h>

@interface BLCollectionService : NSObject

@property (nonatomic, strong) NSString *baseURL;

// Sets baseURL to be use for all REST API calls
- (id)initWithBaseURL:(NSString *)baseURL;

// followers: Load page of a collection's followers
- (void)followersWithCollectionId:(NSNumber *)collectionId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// taps: Load page of a collection's taps
- (void)tapsWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// removeTap: Delete a tap from a user's collection
- (void)removeTapWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// latestTaps: Load a page of the latest taps
- (void)latestTapsWithCollectionId:(NSNumber *)collectionId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// popularTaps: Load a page of popular taps, optionally filtered by type
- (void)popularTapsWithCollectionId:(NSNumber *)collectionId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// featuredTaps: Load a page of featured taps
- (void)featuredTapsWithCollectionId:(NSNumber *)collectionId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// reorder: Update a collection's tap order
- (void)reorderWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andOrdering:(NSString *)ordering
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// unfollow: Unfollow a collection
- (void)unfollowWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// topicTaps: Load a page of the topic's featured taps.
- (void)topicTapsWithUserId:(NSNumber *)userId
				andSlug:(NSString *)slug
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// allTopicTaps: Load a page of all of the topic's taps
- (void)allTopicTapsWithUserId:(NSNumber *)userId
				andSlug:(NSString *)slug
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// topics: List all topics
- (void)topicsWithsuccess:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// topicPreviews: List all topics with thumbnails
- (void)topicPreviewsWithUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// addCollectionTag: Add a tag to a collection
- (void)addCollectionTagWithCollectionId:(NSNumber *)collectionId
				andTagId:(NSNumber *)tagId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// removeCollectionTag: Remove a tag from a collection
- (void)removeCollectionTagWithCollectionId:(NSNumber *)collectionId
				andTagId:(NSNumber *)tagId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// view: Find tap collection by ID
- (void)viewWithCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// view: Find tap collection by ID
- (void)viewWithCollectionId:(NSNumber *)collectionId
				andUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// remove: Remove a user's collection
- (void)removeWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// update: Update a collection
- (void)updateWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andName:(NSString *)name
				andTopicId:(NSNumber *)topicId
				andVisibility:(NSString *)visibility
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// follow: Follow a collection
- (void)followWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// create: Create a new collection
- (void)createWithUserId:(NSNumber *)userId
				andTitle:(NSString *)title
				andTopicId:(NSNumber *)topicId
				andVisibility:(NSString *)visibility
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;


@end