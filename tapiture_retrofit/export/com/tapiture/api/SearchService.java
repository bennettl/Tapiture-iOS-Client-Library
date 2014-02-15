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

public interface SearchService {


	/*
	Search for a specific object type containing a given term
	@param type (Type of object to search for) of type String  
	@param query (Term to search) of type String  
	@param start (Index of the page to load) of type Integer  
	@param count (Size of the pages) of type Integer  
	@param filter (Filter type) of type String  
	*/

	
	@GET("/api/search")
	JsonObject simpleQuery(@Query("type") String type, @Query("query") String query, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter);

	
	@GET("/api/search")
	void simpleQuery(@Query("type") String type, @Query("query") String query, @Query("start") Integer start, @Query("count") Integer count, @Query("filter") String filter, Callback<JsonObject> cb);


}