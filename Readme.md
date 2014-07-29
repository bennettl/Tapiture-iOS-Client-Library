#Tapiture iOS Client Library
### By Bennett Lee

The goal of The **Tapiture iOS Client Library** is to make your life easier and more productive. With the help of the good people at *Mustache* and *Swagger*, **Tapiture iOS Client Library** will dynamically generate an Objective-C client library from the Tapiture REST API. No longer will you need to write an new api functions as Tapiture's API updates. The iOS client library will handle the networking while you focus on writing code that matters.

Whenever an update occurs, simply import "tapiture_retrofit" folder into Eclipse and run the program. Sit back, relax, and the corresponding interface (.h) and implementation (.m) files will be automatically generated for you. Pretty sweet.

I created a BLClientLibraryDemo Project to give you some concrete examples on how the iOS Client Library works. Below is a simple example.

##What You Do
```obj-c
// Get Request: Load a page of users the user is following

[userServce followedUsersWithUserId:[NSNumber numberWithInt:93]
                           andStart:[NSNumber numberWithInt:1]
                           andCount:[NSNumber numberWithInt:1]
                            success:^(id responseObject) {
                                NSLog(@"%@", responseObject);
                            } failure:^(NSError *error) {
                                NSLog(@"Error %@", error);
                            }];

```

##What iOS Client Library Does

```obj-c
- (void)followedUsersWithUserId:(NSNumber *)userId
				andStart:(NSNumber *)start
				andCount:(NSNumber *)count
				success:(void (^)(id responseObject))successBlock 
				failure:(void (^)(NSError *error))failureBlock
{

	// Setup path and parameters
    NSDictionary *params	                = @{
													@"start"	 : start, 
													@"count"	 : count
												};
    NSString *path                          = [NSString stringWithFormat:@"/api/user/%@/following/users?%@", userId, [params queryString]];
	
	// Setup manager and perform action
	AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
	manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", @"application/json", @"text/html", @"text/plain", nil];

	[manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
		successBlock(responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSLog(@"Error: %@ ***** %@", operation.responseString, error);
		failureBlock(error);
	}];

}
```


**Additional  Notes:**

- If a field is optional, DO NOT pass nil, pass an empty string instead

- All parameters are objects (int/long/float needs to be passed as NSNumber, image files are pass as NSData)

- Please insert appropriate parameters (baseUrl, userId, collectionId, etc.) in BLClientLibraryDemo

- Make sure to include categories (NSDictionary+QuerySTring and NSString+MD5)

- For passwords, the function will take care of the MD5 encrpytion (just send the regular password to the function).
