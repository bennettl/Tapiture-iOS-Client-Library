#Tapiture iOS Client Library
##By Bennett Lee

The goal of "BL iOS Client" is to make your life easier and more productive. With the help of the good people at *Mustache* and *Swagger*, "BL iOS Client" will dynamically generate an Objective-C client library from the Tapiture REST API. No longer will you need to write an new api functions as Tapiture's API updates. The iOS client library will handle the networking while you focus on writing code that matters.

Whenever an update occurs, simply import "tapiture_retrofit" folder into Eclipse and run the program. Sit back, relax, and the corresponding interface (.h) and implementation (.m) files will be automatically generated for you. Pretty sweet.

I created a BLClientLibraryDemo Project to give you some concrete examples on how the iOS Client Library works.

Additional  Notes:
- If a field is optional, DO NOT pass nil, pass an empty string instead

- All parameters are objects (int/long/float needs to be passed as NSNumber, image files are pass as NSData)

- Please insert appropriate parameters (baseUrl, userId, collectionId, etc.) in BLClientLibraryDemo

- Make sure to include categories (NSDictionary+QuerySTring and NSString+MD5)

- For passwords, the function will take care of the MD5 encrpytion (just send the regular password to the function).

// http://staging.tapiture.com:9012/images/w300/58/75/bd/b7/28508c40277044ba6459f57c.png

