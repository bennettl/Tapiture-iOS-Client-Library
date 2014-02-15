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

public interface CollectionService {


	/*
	Remove a user's collection
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the collection) of type Long  
	*/

	
	@DELETE("/api/collection/{collectionId}")
	JsonObject remove(@Query("userId") Long userId, @Path("collectionId") Long collectionId);

	
	@DELETE("/api/collection/{collectionId}")
	void remove(@Query("userId") Long userId, @Path("collectionId") Long collectionId, Callback<JsonObject> cb);


	/*
	Update a collection
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the collection) of type Long  
	@param name (Name of the collection) of type String  
	@param topicId (ID of the topic) of type Integer  
	*/

	
	@PUT("/api/collection/{collectionId}")
	JsonObject update(@Query("userId") Long userId, @Path("collectionId") Long collectionId, @Query("name") String name, @Query("topicId") Integer topicId);

	
	@PUT("/api/collection/{collectionId}")
	void update(@Query("userId") Long userId, @Path("collectionId") Long collectionId, @Query("name") String name, @Query("topicId") Integer topicId, Callback<JsonObject> cb);


	/*
	Find tap collection by ID
	@param collectionId (ID of the collection that needs to be fetched) of type Long  
	*/

	
	@GET("/api/collection/{collectionId}")
	JsonObject view(@Path("collectionId") Long collectionId);

	
	@GET("/api/collection/{collectionId}")
	void view(@Path("collectionId") Long collectionId, Callback<JsonObject> cb);


	/*
	Find tap collection by ID
	@param collectionId (ID of the collection that needs to be fetched) of type Long  
	@param userId (ID of viewing user) of type Long  
	*/

	
	@GET("/api/collection/{collectionId}")
	JsonObject view(@Path("collectionId") Long collectionId, @Query("userId") Long userId);

	
	@GET("/api/collection/{collectionId}")
	void view(@Path("collectionId") Long collectionId, @Query("userId") Long userId, Callback<JsonObject> cb);


	/*
	Create a new collection
	@param userId (ID of the user) of type Long  
	@param title (Title of the collection) of type String  
	@param topicId (ID of the topic) of type Integer  
	*/

	
	@POST("/api/collection")
	JsonObject create(@Query("userId") Long userId, @Query("title") String title, @Query("topicId") Integer topicId);

	
	@POST("/api/collection")
	void create(@Query("userId") Long userId, @Query("title") String title, @Query("topicId") Integer topicId, Callback<JsonObject> cb);


	/*
	Follow a collection
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the collection) of type Long  
	*/

	
	@PUT("/api/collection/{collectionId}/follow")
	JsonObject follow(@Query("userId") Long userId, @Path("collectionId") Long collectionId);

	
	@PUT("/api/collection/{collectionId}/follow")
	void follow(@Query("userId") Long userId, @Path("collectionId") Long collectionId, Callback<JsonObject> cb);


	/*
	Unfollow a collection
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the collection) of type Long  
	*/

	
	@DELETE("/api/collection/{collectionId}/unfollow")
	JsonObject unfollow(@Query("userId") Long userId, @Path("collectionId") Long collectionId);

	
	@DELETE("/api/collection/{collectionId}/unfollow")
	void unfollow(@Query("userId") Long userId, @Path("collectionId") Long collectionId, Callback<JsonObject> cb);


	/*
	Load page of a collection's followers
	@param collectionId (ID of the collection) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	*/

	
	@GET("/api/collection/{collectionId}/followers")
	JsonObject followers(@Path("collectionId") Long collectionId, @Query("start") Integer start, @Query("count") Integer count);

	
	@GET("/api/collection/{collectionId}/followers")
	void followers(@Path("collectionId") Long collectionId, @Query("start") Integer start, @Query("count") Integer count, Callback<JsonObject> cb);


	/*
	Load page of a collection's taps
	@param userId (ID of viewing user) of type Long  
	@param collectionId (ID of the collection) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/collection/{collectionId}/taps")
	JsonObject taps(@Query("userId") Long userId, @Path("collectionId") Long collectionId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/collection/{collectionId}/taps")
	void taps(@Query("userId") Long userId, @Path("collectionId") Long collectionId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Delete a tap from a user's collection
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the collection) of type Long  
	@param tapId (ID of the tap to remove) of type Long  
	*/

	
	@DELETE("/api/collection/{collectionId}/taps")
	JsonObject removeTap(@Query("userId") Long userId, @Path("collectionId") Long collectionId, @Query("tapId") Long tapId);

	
	@DELETE("/api/collection/{collectionId}/taps")
	void removeTap(@Query("userId") Long userId, @Path("collectionId") Long collectionId, @Query("tapId") Long tapId, Callback<JsonObject> cb);


	/*
	Load a page of the latest taps
	@param collectionId (Id of the collection) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/collection/latest")
	JsonObject latestTaps(@Query("collectionId") Long collectionId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/collection/latest")
	void latestTaps(@Query("collectionId") Long collectionId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Load a page of popular taps, optionally filtered by type
	@param collectionId (ID of the collection) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/collection/popular")
	JsonObject popularTaps(@Query("collectionId") Long collectionId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/collection/popular")
	void popularTaps(@Query("collectionId") Long collectionId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Load a page of featured taps
	@param collectionId (Id of the collection) of type Long  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/collection/featured")
	JsonObject featuredTaps(@Query("collectionId") Long collectionId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/collection/featured")
	void featuredTaps(@Query("collectionId") Long collectionId, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Update a collection's tap order
	@param userId (ID of the user) of type Long  
	@param collectionId (ID of the collection) of type Long  
	@param ordering (Json array string of the tap IDs in order) of type String  
	*/

	
	@PUT("/api/collection/{collectionId}/reorder")
	JsonObject reorder(@Query("userId") Long userId, @Path("collectionId") Long collectionId, @Query("ordering") String ordering);

	
	@PUT("/api/collection/{collectionId}/reorder")
	void reorder(@Query("userId") Long userId, @Path("collectionId") Long collectionId, @Query("ordering") String ordering, Callback<JsonObject> cb);


	/*
	Load a page of the topic's featured taps.
	@param userId (ID of viewing user) of type Long  
	@param slug (Slug of the topic) of type String  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/collection/topic/{slug}")
	JsonObject topicTaps(@Query("userId") Long userId, @Path("slug") String slug, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/collection/topic/{slug}")
	void topicTaps(@Query("userId") Long userId, @Path("slug") String slug, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	Load a page of all of the topic's taps
	@param userId (ID of viewing user) of type Long  
	@param slug (Slug of the topic) of type String  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/collection/topic/{slug}/all")
	JsonObject allTopicTaps(@Query("userId") Long userId, @Path("slug") String slug, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/collection/topic/{slug}/all")
	void allTopicTaps(@Query("userId") Long userId, @Path("slug") String slug, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


	/*
	List all topics
	*/

	
	@GET("/api/collection/topics")
	JsonObject topics();

	
	@GET("/api/collection/topics")
	void topics(Callback<JsonObject> cb);


	/*
	List all topics with thumbnails
	@param userId (ID of the user) of type Long  
	*/

	
	@GET("/api/collection/topicPreviews")
	JsonObject topicPreviews(@Query("userId") Long userId);

	
	@GET("/api/collection/topicPreviews")
	void topicPreviews(@Query("userId") Long userId, Callback<JsonObject> cb);


	/*
	Add a tag to a collection
	@param collectionId (ID of the collection) of type Long  
	@param tagId (ID of the tag) of type Long  
	*/

	
	@PUT("/api/collection/{collectionId}/tag")
	JsonObject addCollectionTag(@Path("collectionId") Long collectionId, @Query("tagId") Long tagId);

	
	@PUT("/api/collection/{collectionId}/tag")
	void addCollectionTag(@Path("collectionId") Long collectionId, @Query("tagId") Long tagId, Callback<JsonObject> cb);


	/*
	Remove a tag from a collection
	@param collectionId (ID of the collection) of type Long  
	@param tagId (ID of the tag) of type Long  
	*/

	
	@DELETE("/api/collection/{collectionId}/tag")
	JsonObject removeCollectionTag(@Path("collectionId") Long collectionId, @Query("tagId") Long tagId);

	
	@DELETE("/api/collection/{collectionId}/tag")
	void removeCollectionTag(@Path("collectionId") Long collectionId, @Query("tagId") Long tagId, Callback<JsonObject> cb);


}