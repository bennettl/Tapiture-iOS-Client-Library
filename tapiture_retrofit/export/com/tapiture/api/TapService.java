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

public interface TapService {


	/*
	Delete a tap
	@param userId (ID of the user) of type Long  
	@param tapId (ID of the tap) of type Long  
	*/

	
	@DELETE("/api/tap/{tapId}")
	JsonObject delete(@Query("userId") Long userId, @Path("tapId") Long tapId);

	
	@DELETE("/api/tap/{tapId}")
	void delete(@Query("userId") Long userId, @Path("tapId") Long tapId, Callback<JsonObject> cb);


	/*
	Update a tap
	@param userId (ID of the user) of type Long  
	@param tapId (ID of the tap) of type Long  
	@param title (Title of the tap) of type String  
	@param description (Description of the tap) of type String  
	@param sourceId (ID of the source collection) of type Long  
	@param destinationId (ID of the destination collection) of type Long  
	*/

	
	@PUT("/api/tap/{tapId}")
	JsonObject update(@Query("userId") Long userId, @Path("tapId") Long tapId, @Query("title") String title, @Query("description") String description, @Query("sourceId") Long sourceId, @Query("destinationId") Long destinationId);

	
	@PUT("/api/tap/{tapId}")
	void update(@Query("userId") Long userId, @Path("tapId") Long tapId, @Query("title") String title, @Query("description") String description, @Query("sourceId") Long sourceId, @Query("destinationId") Long destinationId, Callback<JsonObject> cb);


	/*
	Find tap by ID
	@param tapId (ID of the tap) of type Long  
	*/

	
	@GET("/api/tap/{tapId}")
	JsonObject view(@Path("tapId") Long tapId);

	
	@GET("/api/tap/{tapId}")
	void view(@Path("tapId") Long tapId, Callback<JsonObject> cb);


	/*
	Find tap by ID viewed by a user
	@param tapId (ID of the tap) of type Long  
	@param userId (ID of the user) of type Long  
	*/

	
	@GET("/api/tap/{tapId}")
	JsonObject detail(@Path("tapId") Long tapId, @Query("userId") Long userId);

	
	@GET("/api/tap/{tapId}")
	void detail(@Path("tapId") Long tapId, @Query("userId") Long userId, Callback<JsonObject> cb);


	/*
	Load a page of the latest taps
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/tap/latest")
	JsonObject latest(@Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/tap/latest")
	void latest(@Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Load a page of the tap's comments
	@param tapId (ID of the tap) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	*/

	
	@GET("/api/tap/{tapId}/comments")
	JsonObject comments(@Path("tapId") Long tapId, @Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/tap/{tapId}/comments")
	void comments(@Path("tapId") Long tapId, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Create a new comment for a given tap
	@param userId (ID of the user) of type Long  
	@param tapId (ID of the tap) of type Long  
	@param message (Comment body) of type String  
	*/

	
	@POST("/api/tap/{tapId}/comments")
	JsonObject addComment(@Query("userId") Long userId, @Path("tapId") Long tapId, @Query("message") String message);

	
	@POST("/api/tap/{tapId}/comments")
	void addComment(@Query("userId") Long userId, @Path("tapId") Long tapId, @Query("message") String message, Callback<JsonObject> cb);


	/*
	Create a new tap from a file
	@param file (Operations on taps) of type TypedFile  
	@param description (Operations on taps) of type String  
	@param title (Operations on taps) of type String  
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the user&#39;s collection) of type Long  
	*/

	@Multipart
	@POST("/api/tap/file")
	JsonObject createTapFromFile(@Part("file") TypedFile file, @Part("description") String description, @Part("title") String title, @Part("userId") Long userId, @Part("collectionId") Long collectionId);

	@Multipart
	@POST("/api/tap/file")
	void createTapFromFile(@Part("file") TypedFile file, @Part("description") String description, @Part("title") String title, @Part("userId") Long userId, @Part("collectionId") Long collectionId, Callback<JsonObject> cb);


	/*
	Create a new tap from a URL
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the user&#39;s collection) of type Long  
	@param fileType (Type of the source) of type String  
	@param resourceUrl (URL of the resource) of type String  
	@param sourceUrl (URL of the parent page of the resource) of type String  
	@param metadataUrl (URL of the resource metadata) of type String  
	@param description (A description of the tap) of type String  
	@param title (The title of the tap) of type String  
	@param html (The embedded html content) of type String  
	@param tapId (ID of existing tap) of type Long  
	@param visibility (Visibility of tap) of type Integer  
	*/

	
	@POST("/api/tap/url")
	JsonObject createTapFromUrl(@Path("userId") Long userId, @Path("collectionId") Long collectionId, @Query("fileType") String fileType, @Query("resourceUrl") String resourceUrl, @Query("sourceUrl") String sourceUrl, @Query("metadataUrl") String metadataUrl, @Query("description") String description, @Query("title") String title, @Query("html") String html, @Query("tapId") Long tapId, @Query("visibility") Integer visibility);

	
	@POST("/api/tap/url")
	void createTapFromUrl(@Path("userId") Long userId, @Path("collectionId") Long collectionId, @Query("fileType") String fileType, @Query("resourceUrl") String resourceUrl, @Query("sourceUrl") String sourceUrl, @Query("metadataUrl") String metadataUrl, @Query("description") String description, @Query("title") String title, @Query("html") String html, @Query("tapId") Long tapId, @Query("visibility") Integer visibility, Callback<JsonObject> cb);


	/*
	Unlike a tap
	@param userId (ID of the user) of type Long  
	@param tapId (ID of the tap) of type Long  
	*/

	
	@DELETE("/api/tap/{tapId}/unlike")
	JsonObject unlike(@Query("userId") Long userId, @Path("tapId") Long tapId);

	
	@DELETE("/api/tap/{tapId}/unlike")
	void unlike(@Query("userId") Long userId, @Path("tapId") Long tapId, Callback<JsonObject> cb);


	/*
	Move a tap from one collection to another
	@param userId (ID of the user) of type Long  
	@param tapId (ID of the tap) of type Long  
	@param sourceId (ID of the source collection) of type Long  
	@param destinationId (ID of the destination collection) of type Long  
	*/

	
	@PUT("/api/tap/{tapId}/move")
	JsonObject move(@Query("userId") Long userId, @Path("tapId") Long tapId, @Query("sourceId") Long sourceId, @Query("destinationId") Long destinationId);

	
	@PUT("/api/tap/{tapId}/move")
	void move(@Query("userId") Long userId, @Path("tapId") Long tapId, @Query("sourceId") Long sourceId, @Query("destinationId") Long destinationId, Callback<JsonObject> cb);


	/*
	Report a tap
	@param userId (ID of the user) of type Long  
	@param tapId (ID of the tap) of type Long  
	@param context (Location of tap) of type String  
	@param report (Report content) of type String  
	*/

	
	@POST("/api/tap/{tapId}/report")
	JsonObject report(@Query("userId") Long userId, @Path("tapId") Long tapId, @Query("context") String context, @Query("report") String report);

	
	@POST("/api/tap/{tapId}/report")
	void report(@Query("userId") Long userId, @Path("tapId") Long tapId, @Query("context") String context, @Query("report") String report, Callback<JsonObject> cb);


	/*
	Load a page of the topic's taps
	@param slug (Slug of the topic) of type String  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/tap")
	JsonObject topic(@Path("slug") String slug, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/tap")
	void topic(@Path("slug") String slug, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Load a page of featured taps, optionally filtered by type
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/tap/featured")
	JsonObject featured(@Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/tap/featured")
	void featured(@Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Load a page of popular taps, optionally filtered by type
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/tap/popular")
	JsonObject popular(@Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/tap/popular")
	void popular(@Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Load a page of the users that liked this tap
	@param tapId (ID of the tap) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	*/

	
	@GET("/api/tap/{tapId}/liked")
	JsonObject liked(@Path("tapId") Long tapId, @Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/tap/{tapId}/liked")
	void liked(@Path("tapId") Long tapId, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Like a tap
	@param userId (ID of the user) of type Long  
	@param tapId (ID of the tap) of type Long  
	*/

	
	@PUT("/api/tap/{tapId}/like")
	JsonObject like(@Query("userId") Long userId, @Path("tapId") Long tapId);

	
	@PUT("/api/tap/{tapId}/like")
	void like(@Query("userId") Long userId, @Path("tapId") Long tapId, Callback<JsonObject> cb);


	/*
	Load a page of the users that have tapped this tap
	@param tapId (ID of the tap) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	*/

	
	@GET("/api/tap/{tapId}/retappers")
	JsonObject retappers(@Path("tapId") Long tapId, @Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/tap/{tapId}/retappers")
	void retappers(@Path("tapId") Long tapId, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Add a tag to a tap
	@param tapId (ID of the tap) of type Long  
	@param tagId (ID of the tag) of type Long  
	*/

	
	@PUT("/api/tap/{tapId}/tag")
	JsonObject addTapTag(@Path("tapId") Long tapId, @Query("tagId") Long tagId);

	
	@PUT("/api/tap/{tapId}/tag")
	void addTapTag(@Path("tapId") Long tapId, @Query("tagId") Long tagId, Callback<JsonObject> cb);


	/*
	Remove a tag from a tap
	@param tapId (ID of the tap) of type Long  
	@param tagId (ID of the tag) of type Long  
	*/

	
	@DELETE("/api/tap/{tapId}/tag")
	JsonObject removeTapTag(@Path("tapId") Long tapId, @Query("tagId") Long tagId);

	
	@DELETE("/api/tap/{tapId}/tag")
	void removeTapTag(@Path("tapId") Long tapId, @Query("tagId") Long tagId, Callback<JsonObject> cb);


}