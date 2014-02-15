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

public interface SocialService {


	/*
	Request authentication via Twitter
	@param userId (ID of the user) of type Long  
	@param callbackUrl (Url to return to after authentication) of type String  
	*/

	
	@GET("/api/social/auth/twitter")
	JsonObject twitterAuthentication(@Query("userId") Long userId, @Query("callbackUrl") String callbackUrl);

	
	@GET("/api/social/auth/twitter")
	void twitterAuthentication(@Query("userId") Long userId, @Query("callbackUrl") String callbackUrl, Callback<JsonObject> cb);


	/*
	Process Twitter authentication callback
	@param callbackUrl (Url to return to after authentication) of type String  
	*/

	
	@GET("/api/social/login/twitter")
	JsonObject twitterCallback(@Query("callbackUrl") String callbackUrl);

	
	@GET("/api/social/login/twitter")
	void twitterCallback(@Query("callbackUrl") String callbackUrl, Callback<JsonObject> cb);


	/*
	Retrieve Twitter Tapiture friends.
	@param userId (ID of the user) of type Long  
	*/

	
	@GET("/api/social/friends/twitter")
	JsonObject twitterFriends(@Query("userId") Long userId);

	
	@GET("/api/social/friends/twitter")
	void twitterFriends(@Query("userId") Long userId, Callback<JsonObject> cb);


	/*
	Request authentication via Facebook.
	@param userId (ID of the user) of type Long  
	@param callbackUrl (Url to return to after authentication) of type String  
	*/

	
	@GET("/api/social/auth/fb")
	JsonObject facebookAuthentication(@Query("userId") Long userId, @Query("callbackUrl") String callbackUrl);

	
	@GET("/api/social/auth/fb")
	void facebookAuthentication(@Query("userId") Long userId, @Query("callbackUrl") String callbackUrl, Callback<JsonObject> cb);


	/*
	Process FB authentication callback
	@param callbackUrl (Url to return to after authentication) of type String  
	*/

	
	@GET("/api/social/login/fb")
	JsonObject facebookCallback(@Query("callbackUrl") String callbackUrl);

	
	@GET("/api/social/login/fb")
	void facebookCallback(@Query("callbackUrl") String callbackUrl, Callback<JsonObject> cb);


	/*
	Retrieve FB Tapiture friends.
	@param userId (ID of the user) of type Long  
	*/

	
	@GET("/api/social/friends/fb")
	JsonObject facebookFriends(@Query("userId") Long userId);

	
	@GET("/api/social/friends/fb")
	void facebookFriends(@Query("userId") Long userId, Callback<JsonObject> cb);


	/*
	Request authentication via Google+
	@param userId (ID of the user) of type Long  
	@param callbackUrl (Url to return to after authentication) of type String  
	*/

	
	@GET("/api/social/auth/google")
	JsonObject googleAuthentication(@Query("userId") Long userId, @Query("callbackUrl") String callbackUrl);

	
	@GET("/api/social/auth/google")
	void googleAuthentication(@Query("userId") Long userId, @Query("callbackUrl") String callbackUrl, Callback<JsonObject> cb);


	/*
	Process Google+ authentication callback
	@param callbackUrl (Url to return to after authentication) of type String  
	*/

	
	@GET("/api/social/login/google")
	JsonObject googleCallback(@Query("callbackUrl") String callbackUrl);

	
	@GET("/api/social/login/google")
	void googleCallback(@Query("callbackUrl") String callbackUrl, Callback<JsonObject> cb);


	/*
	Retrieve Google Tapiture friends.
	@param userId (ID of the user) of type Long  
	*/

	
	@GET("/api/social/friends/google")
	JsonObject googleFriends(@Query("userId") Long userId);

	
	@GET("/api/social/friends/google")
	void googleFriends(@Query("userId") Long userId, Callback<JsonObject> cb);


}