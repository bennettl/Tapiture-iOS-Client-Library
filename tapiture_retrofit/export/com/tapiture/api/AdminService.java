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

public interface AdminService {


	/*
	List all tags
	*/

	
	@GET("/api/admin/tags")
	JsonObject tags();

	
	@GET("/api/admin/tags")
	void tags(Callback<JsonObject> cb);


	/*
	Force reaquisition of tap resource
	@param tapId (Id of the tap) of type Long  
	*/

	
	@GET("/api/admin/regenerate")
	JsonObject regenerateTapUrl(@Query("tapId") Long tapId);

	
	@GET("/api/admin/regenerate")
	void regenerateTapUrl(@Query("tapId") Long tapId, Callback<JsonObject> cb);


	/*
	Produce Json Schema for given class name
	@param className (Model class name) of type String  
	*/

	
	@GET("/api/admin/schema")
	JsonObject jsonSchema(@Query("className") String className);

	
	@GET("/api/admin/schema")
	void jsonSchema(@Query("className") String className, Callback<JsonObject> cb);


	/*
	Set a user property
	@param userId (ID of the user) of type Long  
	@param key (Property key) of type String  
	@param value (Property value) of type String  
	*/

	
	@PUT("/api/admin/user/{userId}/property")
	JsonObject setUserProperty(@Path("userId") Long userId, @Query("key") String key, @Query("value") String value);

	
	@PUT("/api/admin/user/{userId}/property")
	void setUserProperty(@Path("userId") Long userId, @Query("key") String key, @Query("value") String value, Callback<JsonObject> cb);


	/*
	Delete all trace of a user from the system
	@param userId (Id of the user) of type Long  
	*/

	
	@DELETE("/api/admin/user/{userId}/nuke")
	JsonObject deleteUser(@Path("userId") Long userId);

	
	@DELETE("/api/admin/user/{userId}/nuke")
	void deleteUser(@Path("userId") Long userId, Callback<JsonObject> cb);


	/*
	Create a new tag with the given name
	@param tagName (Name of the tag to create) of type String  
	*/

	
	@POST("/api/admin/tag")
	JsonObject createTag(@Query("tagName") String tagName);

	
	@POST("/api/admin/tag")
	void createTag(@Query("tagName") String tagName, Callback<JsonObject> cb);


	/*
	Create a new filter
	@param type (Type of the filter) of type String  
	@param value (Value of the filter) of type String  
	*/

	
	@POST("/api/admin/filter")
	JsonObject createFilter(@Query("type") String type, @Query("value") String value);

	
	@POST("/api/admin/filter")
	void createFilter(@Query("type") String type, @Query("value") String value, Callback<JsonObject> cb);


	/*
	Delete a filter
	@param type (Type of the filter) of type String  
	@param value (Value of the filter) of type String  
	*/

	
	@DELETE("/api/admin/filter")
	JsonObject deleteFilter(@Query("type") String type, @Query("value") String value);

	
	@DELETE("/api/admin/filter")
	void deleteFilter(@Query("type") String type, @Query("value") String value, Callback<JsonObject> cb);


	/*
	Update tap status
	@param tapId (ID of the tap) of type Long  
	@param status (New status value) of type String  
	*/

	
	@PUT("/api/admin/tap/{tapId}/status")
	JsonObject updateTapStatus(@Path("tapId") Long tapId, @Query("status") String status);

	
	@PUT("/api/admin/tap/{tapId}/status")
	void updateTapStatus(@Path("tapId") Long tapId, @Query("status") String status, Callback<JsonObject> cb);


	/*
	Change tap topic
	@param tapId (ID of the tap) of type Long  
	@param topicId (ID of the topic) of type Integer  
	*/

	
	@PUT("/api/admin/tap/{tapId}/topic")
	JsonObject setTapTopic(@Path("tapId") Long tapId, @Query("topicId") Integer topicId);

	
	@PUT("/api/admin/tap/{tapId}/topic")
	void setTapTopic(@Path("tapId") Long tapId, @Query("topicId") Integer topicId, Callback<JsonObject> cb);


	/*
	Change tap visibility setting. 0 = private, 1 = shared, 2 = public
	@param tapId (ID of the tap) of type Long  
	@param visibility (Privacy state) of type Integer  
	*/

	
	@PUT("/api/admin/tap/{tapId}/privacy")
	JsonObject setTapVisibility(@Path("tapId") Long tapId, @Query("visibility") Integer visibility);

	
	@PUT("/api/admin/tap/{tapId}/privacy")
	void setTapVisibility(@Path("tapId") Long tapId, @Query("visibility") Integer visibility, Callback<JsonObject> cb);


	/*
	Change a collection's topic
	@param collectionId (ID of the collection) of type Long  
	@param topicId (ID of the topic) of type Integer  
	*/

	
	@PUT("/api/admin/collection/{collectionId}/topic")
	JsonObject setCollectionTopic(@Path("collectionId") Long collectionId, @Query("topicId") Integer topicId);

	
	@PUT("/api/admin/collection/{collectionId}/topic")
	void setCollectionTopic(@Path("collectionId") Long collectionId, @Query("topicId") Integer topicId, Callback<JsonObject> cb);


	/*
	Update user status
	@param userId (ID of the user) of type Long  
	@param status (New status value) of type String  
	*/

	
	@PUT("/api/admin/user/{userId}/status")
	JsonObject updateUserStatus(@Path("userId") Long userId, @Query("status") String status);

	
	@PUT("/api/admin/user/{userId}/status")
	void updateUserStatus(@Path("userId") Long userId, @Query("status") String status, Callback<JsonObject> cb);


	/*
	Set a tap property
	@param tapId (ID of the tap) of type Long  
	@param key (Property key) of type String  
	@param value (Property value) of type String  
	*/

	
	@PUT("/api/admin/tap/{tapId}/property")
	JsonObject setTapProperty(@Path("tapId") Long tapId, @Query("key") String key, @Query("value") String value);

	
	@PUT("/api/admin/tap/{tapId}/property")
	void setTapProperty(@Path("tapId") Long tapId, @Query("key") String key, @Query("value") String value, Callback<JsonObject> cb);


	/*
	Promote a tap
	@param tapId (ID of the tap) of type Long  
	@param state (featured state) of type Integer  
	*/

	
	@PUT("/api/admin/tap/{tapId}/popular")
	JsonObject promoteTap(@Path("tapId") Long tapId, @Query("state") Integer state);

	
	@PUT("/api/admin/tap/{tapId}/popular")
	void promoteTap(@Path("tapId") Long tapId, @Query("state") Integer state, Callback<JsonObject> cb);


	/*
	Batch index a model class between start and index
	@param objectType (Object type) of type String  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	*/

	
	@GET("/api/admin/index")
	JsonObject batchIndex(@Query("objectType") String objectType, @Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/admin/index")
	void batchIndex(@Query("objectType") String objectType, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Load a page of unprocessed taps
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/admin/tap/pending")
	JsonObject pendingPage(@Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/admin/tap/pending")
	void pendingPage(@Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Force reaquisition of tap's that have a null url
	*/

	
	@GET("/api/admin/regenerateAll")
	JsonObject regenerateMissingTapUrls();

	
	@GET("/api/admin/regenerateAll")
	void regenerateMissingTapUrls(Callback<JsonObject> cb);


	/*
	Create an activity
	@param userId (ID of the user) of type Long  
	@param actorId (ID of the actor) of type Long  
	@param verb (The verb) of type String  
	@param objectId (The id of the object) of type Long  
	@param objectType (Type of the object) of type String  
	@param message (Optional message) of type String  
	*/

	
	@POST("/api/admin/activity")
	JsonObject createActivity(@Query("userId") Long userId, @Query("actorId") Long actorId, @Query("verb") String verb, @Query("objectId") Long objectId, @Query("objectType") String objectType, @Query("message") String message);

	
	@POST("/api/admin/activity")
	void createActivity(@Query("userId") Long userId, @Query("actorId") Long actorId, @Query("verb") String verb, @Query("objectId") Long objectId, @Query("objectType") String objectType, @Query("message") String message, Callback<JsonObject> cb);


	/*
	Post a message to a topic
	@param topic (Name of the topic) of type String  
	@param title (Title of the message) of type String  
	@param content (Content of the message) of type String  
	@param type (Type of the message) of type String  
	*/

	
	@PUT("/api/admin/message/topic")
	JsonObject postTopicMessage(@Query("topic") String topic, @Query("title") String title, @Query("content") String content, @Query("type") String type);

	
	@PUT("/api/admin/message/topic")
	void postTopicMessage(@Query("topic") String topic, @Query("title") String title, @Query("content") String content, @Query("type") String type, Callback<JsonObject> cb);


	/*
	Load a page of pending Tap Reports
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	*/

	
	@GET("/api/admin/tap/reports")
	JsonObject tapReports(@Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/admin/tap/reports")
	void tapReports(@Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Clear all reports for a given tap
	@param tapId (Id of the tap) of type Long  
	@param status (Status of the tap) of type Integer  
	*/

	
	@PUT("/api/admin/tap/reports")
	JsonObject processTapReports(@Query("tapId") Long tapId, @Query("status") Integer status);

	
	@PUT("/api/admin/tap/reports")
	void processTapReports(@Query("tapId") Long tapId, @Query("status") Integer status, Callback<JsonObject> cb);


}