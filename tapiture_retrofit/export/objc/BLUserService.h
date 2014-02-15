//
//  BLUserService.h
//  API Name: User
//
//  Created by Bennett Lee on 2/7/14.
//

#import <Foundation/Foundation.h>

@interface BLUserService : NSObject

@property (nonatomic, strong) NSString *baseURL;

// Sets baseURL to be use for all REST API calls
- (id)initWithBaseURL:(NSString *)baseURL;

// logout: Terminate user session
- (void)logoutWithsuccess:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// createCollection: Create a new collection
- (void)createCollectionWithUserId:(NSNumber *)userId
				andTitle:(NSString *)title
				andTopicId:(NSNumber *)topicId
				andVisibility:(NSString *)visibility
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// collections: Load a page of the user's collections
- (void)collectionsWithVisitorId:(NSNumber *)visitorId
				andUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// removeCollection: Remove a collection
- (void)removeCollectionWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// likes: Load a page of the user's likes
- (void)likesWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// likeTap: Like a tap
- (void)likeTapWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// unlikeTap: Unlike a tap
- (void)unlikeTapWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// followedUsers: Load a page of users the user is following
- (void)followedUsersWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// followUser: Follow a user
- (void)followUserWithUserId:(NSNumber *)userId
				andFollowedId:(NSNumber *)followedId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// unfollowUser: Unfollow a user
- (void)unfollowUserWithUserId:(NSNumber *)userId
				andFollowedId:(NSNumber *)followedId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// activities: Load a page of the user's actvity stream
- (void)activitiesWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// markActivitiesRead: Mark all activities in a date range as having been read.
- (void)markActivitiesReadWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// followCollection: Follow a collection
- (void)followCollectionWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// unfollowCollection: Unfollow a collection
- (void)unfollowCollectionWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// followedCollections: Load a page of collections the user is following
- (void)followedCollectionsWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// updateProfile: Update a user's profile.
- (void)updateProfileWithUserId:(NSNumber *)userId
				andEmail:(NSString *)email
				andDisplayName:(NSString *)displayName
				andLocation:(NSString *)location
				andBio:(NSString *)bio
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// followers: Load a page of the user's followers
- (void)followersWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// addTap: Add an existing tap to a user's collection
- (void)addTapWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andTapId:(NSNumber *)tapId
				andTitle:(NSString *)title
				andDescription:(NSString *)description
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// removeTap: Remove a tap from a user's collection
- (void)removeTapWithUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				andTapId:(NSNumber *)tapId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// taps: Load a page of the user's taps
- (void)tapsWithVisitorId:(NSNumber *)visitorId
				andUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// moveTap: Move a tap from one collection to another
- (void)moveTapWithUserId:(NSNumber *)userId
				andTapId:(NSNumber *)tapId
				andSourceId:(NSNumber *)sourceId
				andDestinationId:(NSNumber *)destinationId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// requestPasswordReset: Request a password reset
- (void)requestPasswordResetWithEmail:(NSString *)email
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// timeline: Load a page of the user's timeline
- (void)timelineWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// collectionsList: Load a compact page of the user's collections
- (void)collectionsListWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andOrder:(NSString *)order
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// feed: Load a page from the user's feed
- (void)feedWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				andFilter:(NSString *)filter
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// updateAvatarWithFile: Set the user's avatar from a file
- (void)updateAvatarWithFileWithFile:(NSData *)file
				andUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// updateAvatarWithUrl: Set the user's avatar from a url
- (void)updateAvatarWithUrlWithUserId:(NSNumber *)userId
				andFileType:(NSString *)fileType
				andResourceUrl:(NSString *)resourceUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// updateBannerWithFile: Set the user's banner from a file
- (void)updateBannerWithFileWithFile:(NSData *)file
				andUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// updateBannerWithUrl: Set the user's banner from a url
- (void)updateBannerWithUrlWithUserId:(NSNumber *)userId
				andFileType:(NSString *)fileType
				andResourceUrl:(NSString *)resourceUrl
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// createUrlTap: Create a new tap from a url
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
				failure:(void (^)(NSError *error))failureBlock;

// createFileTap: Create a new tap from a file
- (void)createFileTapWithFile:(NSData *)file
				andDescription:(NSString *)description
				andTitle:(NSString *)title
				andVisibility:(NSString *)visibility
				andUserId:(NSNumber *)userId
				andCollectionId:(NSNumber *)collectionId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// login: Login with username and password
- (void)loginWithUsername:(NSString *)username
				andPassword:(NSString *)password
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// refreshSession: Refresh a user's session
- (void)refreshSessionWithsuccess:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// lookupResetPasswordToken: Lookup reset password token
- (void)lookupResetPasswordTokenWithToken:(NSString *)token
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// setPassword: Set new user password
- (void)setPasswordWithUserId:(NSNumber *)userId
				andToken:(NSString *)token
				andPassword1:(NSString *)password1
				andPassword2:(NSString *)password2
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// view: Find user by ID
- (void)viewWithUserId:(NSNumber *)userId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// profile: Load a user's profile
- (void)profileWithUserId:(NSNumber *)userId
				andVisitorId:(NSNumber *)visitorId
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;

// register: Register a new user
- (void)registerWithUsername:(NSString *)username
				andEmail:(NSString *)email
				andPassword:(NSString *)password
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock;


@end