//
//  BLAdminService.h
//  API Name: Admin
//
//  Created by Bennett Lee on 2/7/14.
//

#import <Foundation/Foundation.h>

@interface BLAdminService : NSObject

@property (nonatomic, strong) NSString *baseURL;

// Sets baseURL to be use for all REST API calls
- (id)initWithBaseURL:(NSString *)baseURL;

// setUserProperty: Set a user property
- (void)setUserPropertyWithUserId:(NSNumber *)userId
				andKey:(NSString *)key
				andValue:(NSString *)value
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// deleteUser: Delete all trace of a user from the system
- (void)deleteUserWithUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// regenerateTapUrl: Force reaquisition of tap resource
- (void)regenerateTapUrlWithTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// jsonSchema: Produce Json Schema for given class name
- (void)jsonSchemaWithClassName:(NSString *)className
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// createTag: Create a new tag with the given name
- (void)createTagWithTagName:(NSString *)tagName
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// createFilter: Create a new filter
- (void)createFilterWithType:(NSString *)type
				andValue:(NSString *)value
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// deleteFilter: Delete a filter
- (void)deleteFilterWithType:(NSString *)type
				andValue:(NSString *)value
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// login: Admin login with username and password
- (void)loginWithUsername:(NSString *)username
				andPassword:(NSString *)password
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// batchUpdateTaps: Batch update tap status. Request should be a map of the type of change (topic, visibility, status) to maps of values mapped to an array of tap ids.
- (void)batchUpdateTapsWithUpdates:(NSString *)updates
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// updateTapStatus: Update tap status
- (void)updateTapStatusWithTapId:(NSNumber *)tapId
				andStatus:(NSString *)status
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// setTapTopic: Change tap topic
- (void)setTapTopicWithTapId:(NSNumber *)tapId
				andTopicId:(NSNumber *)topicId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// setTapVisibility: Change tap visibility setting. 0 = private, 1 = shared, 2 = public
- (void)setTapVisibilityWithTapId:(NSNumber *)tapId
				andVisibility:(NSNumber *)visibility
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// setCollectionTopic: Change a collection's topic
- (void)setCollectionTopicWithCollectionId:(NSNumber *)collectionId
				andTopicId:(NSNumber *)topicId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// updateUserStatus: Update user status
- (void)updateUserStatusWithUserId:(NSNumber *)userId
				andStatus:(NSString *)status
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// setTapProperty: Set a tap property
- (void)setTapPropertyWithTapId:(NSNumber *)tapId
				andKey:(NSString *)key
				andValue:(NSString *)value
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// promoteTap: Promote a tap
- (void)promoteTapWithTapId:(NSNumber *)tapId
				andState:(NSNumber *)state
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// batchIndex: Batch index a model class between start and index
- (void)batchIndexWithObjectType:(NSString *)objectType
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// pendingPage: Load a page of unprocessed taps
- (void)pendingPageWithStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// loadTap: Load an individual tap
- (void)loadTapWithTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// regenerateMissingTapUrls: Force reaquisition of tap's that have a null url
- (void)regenerateMissingTapUrlsWithsuccess:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// createActivity: Create an activity
- (void)createActivityWithUserId:(NSNumber *)userId
				andActorId:(NSNumber *)actorId
				andVerb:(NSString *)verb
				andObjectId:(NSNumber *)objectId
				andObjectType:(NSString *)objectType
				andMessage:(NSString *)message
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// postTopicMessage: Post a message to a topic
- (void)postTopicMessageWithTopic:(NSString *)topic
				andTitle:(NSString *)title
				andContent:(NSString *)content
				andType:(NSString *)type
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// tapReports: Load a page of pending Tap Reports
- (void)tapReportsWithStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// processTapReports: Clear all reports for a given tap
- (void)processTapReportsWithTapId:(NSNumber *)tapId
				andStatus:(NSNumber *)status
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// purgeEbeanCache: Force purge of ebean cache
- (void)purgeEbeanCacheWithsuccess:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// tags: List all tags
- (void)tagsWithsuccess:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;


@end