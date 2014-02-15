package com.tapiture.api;

import com.google.gson.JsonObject;

import retrofit.http.Body;
import retrofit.http.DELETE;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.PUT;
import retrofit.http.Path;
import retrofit.http.Query;
import retrofit.http.Field;
import retrofit.http.Part;
import retrofit.Callback;

public interface UserService {


	/*
	Load a user's profile
	@param userId (ID of the user) of type Long  
	@param visitorId (ID of viewing user) of type Long  
	*/

	
	@GET("/api/user/{userId}/profile")
	JsonObject profile(@Path("userId") Long userId, @Query("visitorId") Long visitorId);

	
	@GET("/api/user/{userId}/profile")
	void profile(@Path("userId") Long userId, @Query("visitorId") Long visitorId, Callback<JsonObject> cb);


	/*
	Register a new user
	@param username (Desired username) of type String  
	@param email (Email address) of type String  
	@param password (Desired password) of type String  
	*/

	
	@POST("/api/user")
	JsonObject register(@Query("username") String username, @Query("email") String email, @Query("password") String password);

	
	@POST("/api/user")
	void register(@Query("username") String username, @Query("email") String email, @Query("password") String password, Callback<JsonObject> cb);


	/*
	Find user by ID
	@param userId (ID of user that needs to be fetched) of type Long  
	*/

	
	@GET("/api/user/{userId}")
	JsonObject view(@Path("userId") Long userId);

	
	@GET("/api/user/{userId}")
	void view(@Path("userId") Long userId, Callback<JsonObject> cb);


	/*
	Terminate user session
	*/

	
	@GET("/api/user/logout")
	JsonObject logout();

	
	@GET("/api/user/logout")
	void logout(Callback<JsonObject> cb);


	/*
	Request a password reset
	@param email (User email address) of type String  
	*/

	
	@POST("/api/user/reset")
	JsonObject requestPasswordReset(@Query("email") String email);

	
	@POST("/api/user/reset")
	void requestPasswordReset(@Query("email") String email, Callback<JsonObject> cb);


	/*
	Set new user password
	@param userId (User id) of type Long  
	@param token (Reset token) of type String  
	@param password1 (Password 1) of type String  
	@param password2 (Password 2) of type String  
	*/

	
	@PUT("/api/user/password")
	JsonObject setPassword(@Query("userId") Long userId, @Query("token") String token, @Query("password1") String password1, @Query("password2") String password2);

	
	@PUT("/api/user/password")
	void setPassword(@Query("userId") Long userId, @Query("token") String token, @Query("password1") String password1, @Query("password2") String password2, Callback<JsonObject> cb);


	/*
	Create a new collection
	@param userId (ID of the user) of type Long  
	@param title (Title of the collection) of type String  
	@param topicId (ID of the topic) of type Integer  
	*/

	
	@POST("/api/user/{userId}/collections")
	JsonObject createCollection(@Path("userId") Long userId, @Query("title") String title, @Query("topicId") Integer topicId);

	
	@POST("/api/user/{userId}/collections")
	void createCollection(@Path("userId") Long userId, @Query("title") String title, @Query("topicId") Integer topicId, Callback<JsonObject> cb);


	/*
	Load a page of the user's collections
	@param userId (ID of the user) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	*/

	
	@GET("/api/user/{userId}/collections")
	JsonObject collections(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/user/{userId}/collections")
	void collections(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Remove a collection
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the collection) of type Long  
	*/

	
	@DELETE("/api/user/{userId}/collections")
	JsonObject removeCollection(@Path("userId") Long userId, @Query("collectionId") Long collectionId);

	
	@DELETE("/api/user/{userId}/collections")
	void removeCollection(@Path("userId") Long userId, @Query("collectionId") Long collectionId, Callback<JsonObject> cb);


	/*
	Load a page of the user's followers
	@param userId (ID of the user) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	*/

	
	@GET("/api/user/{userId}/followers")
	JsonObject followers(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/user/{userId}/followers")
	void followers(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Add an existing tap to a user's collection
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the collection) of type Long  
	@param tapId (ID of the tap to add) of type Long  
	@param title (Title of the tap) of type String  
	@param description (Description of the tap) of type String  
	*/

	
	@PUT("/api/user/{userId}/collections/{collectionId}")
	JsonObject addTap(@Path("userId") Long userId, @Path("collectionId") Long collectionId, @Query("tapId") Long tapId, @Query("title") String title, @Query("description") String description);

	
	@PUT("/api/user/{userId}/collections/{collectionId}")
	void addTap(@Path("userId") Long userId, @Path("collectionId") Long collectionId, @Query("tapId") Long tapId, @Query("title") String title, @Query("description") String description, Callback<JsonObject> cb);


	/*
	Remove a tap from a user's collection
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the collection) of type Long  
	@param tapId (ID of the tap to remove) of type Long  
	*/

	
	@DELETE("/api/user/{userId}/collections/{collectionId}")
	JsonObject removeTap(@Path("userId") Long userId, @Path("collectionId") Long collectionId, @Query("tapId") Long tapId);

	
	@DELETE("/api/user/{userId}/collections/{collectionId}")
	void removeTap(@Path("userId") Long userId, @Path("collectionId") Long collectionId, @Query("tapId") Long tapId, Callback<JsonObject> cb);


	/*
	Load a page of the user's taps
	@param userId (ID of the user) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/user/{userId}/taps")
	JsonObject taps(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/user/{userId}/taps")
	void taps(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Load a page of the user's likes
	@param userId (ID of the user) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/user/{userId}/likes")
	JsonObject likes(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/user/{userId}/likes")
	void likes(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Like a tap
	@param userId (ID of the user) of type Long  
	@param tapId (ID of the tap) of type Long  
	*/

	
	@PUT("/api/user/{userId}/likes")
	JsonObject likeTap(@Path("userId") Long userId, @Query("tapId") Long tapId);

	
	@PUT("/api/user/{userId}/likes")
	void likeTap(@Path("userId") Long userId, @Query("tapId") Long tapId, Callback<JsonObject> cb);


	/*
	Unlike a tap
	@param userId (ID of the user) of type Long  
	@param tapId (ID of the tap) of type Long  
	*/

	
	@DELETE("/api/user/{userId}/likes")
	JsonObject unlikeTap(@Path("userId") Long userId, @Query("tapId") Long tapId);

	
	@DELETE("/api/user/{userId}/likes")
	void unlikeTap(@Path("userId") Long userId, @Query("tapId") Long tapId, Callback<JsonObject> cb);


	/*
	Load a page of users the user is following
	@param userId (ID of the user) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	*/

	
	@GET("/api/user/{userId}/following/users")
	JsonObject followedUsers(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/user/{userId}/following/users")
	void followedUsers(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Follow a user
	@param userId (ID of the user) of type Long  
	@param followedId (ID of the user to follow) of type Long  
	*/

	
	@PUT("/api/user/{userId}/following/users")
	JsonObject followUser(@Path("userId") Long userId, @Query("followedId") Long followedId);

	
	@PUT("/api/user/{userId}/following/users")
	void followUser(@Path("userId") Long userId, @Query("followedId") Long followedId, Callback<JsonObject> cb);


	/*
	Unfollow a user
	@param userId (ID of the user) of type Long  
	@param followedId (ID of the user to unfollow) of type Long  
	*/

	
	@DELETE("/api/user/{userId}/following/users")
	JsonObject unfollowUser(@Path("userId") Long userId, @Query("followedId") Long followedId);

	
	@DELETE("/api/user/{userId}/following/users")
	void unfollowUser(@Path("userId") Long userId, @Query("followedId") Long followedId, Callback<JsonObject> cb);


	/*
	Load a page of collections the user is following
	@param userId (ID of the user) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	*/

	
	@GET("/api/user/{userId}/following/collections")
	JsonObject followedCollections(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/user/{userId}/following/collections")
	void followedCollections(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Follow a collection
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the collection to follow) of type Long  
	*/

	
	@PUT("/api/user/{userId}/following/collections")
	JsonObject followCollection(@Path("userId") Long userId, @Query("collectionId") Long collectionId);

	
	@PUT("/api/user/{userId}/following/collections")
	void followCollection(@Path("userId") Long userId, @Query("collectionId") Long collectionId, Callback<JsonObject> cb);


	/*
	Unfollow a collection
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the collection to unfollow) of type Long  
	*/

	
	@DELETE("/api/user/{userId}/following/collections")
	JsonObject unfollowCollection(@Path("userId") Long userId, @Query("collectionId") Long collectionId);

	
	@DELETE("/api/user/{userId}/following/collections")
	void unfollowCollection(@Path("userId") Long userId, @Query("collectionId") Long collectionId, Callback<JsonObject> cb);


	/*
	Load a page of the user's actvity stream
	@param userId (ID of the user) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	*/

	
	@GET("/api/user/{userId}/activities")
	JsonObject activities(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/user/{userId}/activities")
	void activities(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Mark all activities in a date range as having been read.
	@param userId (ID of the user) of type Long  
	@param start (Range start date) of type Integer  
	@param count (Range end date) of type Integer  
	*/

	
	@PUT("/api/user/{userId}/activities")
	JsonObject markActivitiesRead(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count);

	
	@PUT("/api/user/{userId}/activities")
	void markActivitiesRead(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Update a user's profile.
	@param userId (ID of the user) of type Long  
	@param email (Email address) of type String  
	@param displayName (Display name) of type String  
	@param location (Location) of type String  
	@param bio (Biography) of type String  
	*/

	
	@PUT("/api/user/{userId}/update")
	JsonObject updateProfile(@Path("userId") Long userId, @Query("email") String email, @Query("displayName") String displayName, @Query("location") String location, @Query("bio") String bio);

	
	@PUT("/api/user/{userId}/update")
	void updateProfile(@Path("userId") Long userId, @Query("email") String email, @Query("displayName") String displayName, @Query("location") String location, @Query("bio") String bio, Callback<JsonObject> cb);


	/*
	Move a tap from one collection to another
	@param userId (ID of the user) of type Long  
	@param tapId (ID of the tap) of type Long  
	@param sourceId (ID of the source collection) of type Long  
	@param destinationId (ID of the destination collection) of type Long  
	*/

	
	@PUT("/api/user/{userId}/taps/{tapId}/move")
	JsonObject moveTap(@Path("userId") Long userId, @Path("tapId") Long tapId, @Query("sourceId") Long sourceId, @Query("destinationId") Long destinationId);

	
	@PUT("/api/user/{userId}/taps/{tapId}/move")
	void moveTap(@Path("userId") Long userId, @Path("tapId") Long tapId, @Query("sourceId") Long sourceId, @Query("destinationId") Long destinationId, Callback<JsonObject> cb);


	/*
	Load a page of the user's timeline
	@param userId (ID of the user) of type Long  
	@param start (Index of the page to load (paged by day)) of type Integer  
	@param count (Size of the pages (paged by day)) of type Integer  
	*/

	
	@GET("/api/user/{userId}/timeline")
	JsonObject timeline(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/user/{userId}/timeline")
	void timeline(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Load a compact page of the user's collections
	@param userId (ID of the user) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param order (Order type) of type String  
	*/

	
	@GET("/api/user/{userId}/collectionsList")
	JsonObject collectionsList(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, @Query("order") String order);

	
	@GET("/api/user/{userId}/collectionsList")
	void collectionsList(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, @Query("order") String order, Callback<JsonObject> cb);


	/*
	Load a page from the user's feed
	@param userId (ID of the user) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/user/{userId}/feed")
	JsonObject feed(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/user/{userId}/feed")
	void feed(@Path("userId") Long userId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Set the user's avatar from a file
	@param file (Operations on users) of type TypedFile  
	@param userId (ID of the user) of type Long  
	*/

	@Multipart
	@POST("/api/user/{userId}/avatar/file")
	JsonObject updateAvatarWithFile(@Part("file") TypedFile file, @Part("userId") Long userId);

	@Multipart
	@POST("/api/user/{userId}/avatar/file")
	void updateAvatarWithFile(@Part("file") TypedFile file, @Part("userId") Long userId, Callback<JsonObject> cb);


	/*
	Set the user's avatar from a url
	@param userId (ID of the user) of type Long  
	@param fileType (Type of the source) of type String  
	@param resourceUrl (URL of the resource) of type String  
	*/

	
	@POST("/api/user/{userId}/avatar/url")
	JsonObject updateAvatarWithUrl(@Path("userId") Long userId, @Query("fileType") String fileType, @Query("resourceUrl") String resourceUrl);

	
	@POST("/api/user/{userId}/avatar/url")
	void updateAvatarWithUrl(@Path("userId") Long userId, @Query("fileType") String fileType, @Query("resourceUrl") String resourceUrl, Callback<JsonObject> cb);


	/*
	Set the user's banner from a file
	@param file (Operations on users) of type TypedFile  
	@param userId (ID of the user) of type Long  
	*/

	@Multipart
	@POST("/api/user/{userId}/banner/file")
	JsonObject updateBannerWithFile(@Part("file") TypedFile file, @Part("userId") Long userId);

	@Multipart
	@POST("/api/user/{userId}/banner/file")
	void updateBannerWithFile(@Part("file") TypedFile file, @Part("userId") Long userId, Callback<JsonObject> cb);


	/*
	Set the user's banner from a url
	@param userId (ID of the user) of type Long  
	@param fileType (Type of the source) of type String  
	@param resourceUrl (URL of the resource) of type String  
	*/

	
	@POST("/api/user/{userId}/banner/url")
	JsonObject updateBannerWithUrl(@Path("userId") Long userId, @Query("fileType") String fileType, @Query("resourceUrl") String resourceUrl);

	
	@POST("/api/user/{userId}/banner/url")
	void updateBannerWithUrl(@Path("userId") Long userId, @Query("fileType") String fileType, @Query("resourceUrl") String resourceUrl, Callback<JsonObject> cb);


	/*
	Create a new tap from a url
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the user&#39;s collection) of type Long  
	@param fileType (Type of the source) of type String  
	@param resourceUrl (URL of the resource) of type String  
	@param sourceUrl (URL of the parent page of the resource) of type String  
	@param metadataUrl (URL of the resource metadata) of type String  
	@param description (A description of the tap) of type String  
	@param title (The title of the tap) of type String  
	@param html (The embedded html content) of type String  
	@param visibility (Visibility of tap) of type Integer  
	*/

	
	@POST("/api/user/{userId}/collections/{collectionId}/url")
	JsonObject createUrlTap(@Path("userId") Long userId, @Path("collectionId") Long collectionId, @Query("fileType") String fileType, @Query("resourceUrl") String resourceUrl, @Query("sourceUrl") String sourceUrl, @Query("metadataUrl") String metadataUrl, @Query("description") String description, @Query("title") String title, @Query("html") String html, @Query("visibility") Integer visibility);

	
	@POST("/api/user/{userId}/collections/{collectionId}/url")
	void createUrlTap(@Path("userId") Long userId, @Path("collectionId") Long collectionId, @Query("fileType") String fileType, @Query("resourceUrl") String resourceUrl, @Query("sourceUrl") String sourceUrl, @Query("metadataUrl") String metadataUrl, @Query("description") String description, @Query("title") String title, @Query("html") String html, @Query("visibility") Integer visibility, Callback<JsonObject> cb);


	/*
	Create a new tap from a file
	@param file (Operations on users) of type TypedFile  
	@param description (Operations on users) of type String  
	@param title (Operations on users) of type String  
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the user&#39;s collection) of type Long  
	*/

	@Multipart
	@POST("/api/user/{userId}/collections/{collectionId}/file")
	JsonObject createFileTap(@Part("file") TypedFile file, @Part("description") String description, @Part("title") String title, @Part("userId") Long userId, @Part("collectionId") Long collectionId);

	@Multipart
	@POST("/api/user/{userId}/collections/{collectionId}/file")
	void createFileTap(@Part("file") TypedFile file, @Part("description") String description, @Part("title") String title, @Part("userId") Long userId, @Part("collectionId") Long collectionId, Callback<JsonObject> cb);


	/*
	Login with username and password
	@param username (Username) of type String  
	@param password (Password) of type String  
	*/

	
	@GET("/api/user/login")
	JsonObject login(@Query("username") String username, @Query("password") String password);

	
	@GET("/api/user/login")
	void login(@Query("username") String username, @Query("password") String password, Callback<JsonObject> cb);


	/*
	Lookup reset password token
	@param token (Reset token) of type String  
	*/

	
	@GET("/api/user/reset/token")
	JsonObject lookupResetPasswordToken(@Query("token") String token);

	
	@GET("/api/user/reset/token")
	void lookupResetPasswordToken(@Query("token") String token, Callback<JsonObject> cb);


}