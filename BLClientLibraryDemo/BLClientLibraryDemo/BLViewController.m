//
//  BLViewController.m
//  BLClientLibraryDemo
//
//  Created by Bennett Lee on 2/14/14.
//  Copyright (c) 2014 Bennett Lee. All rights reserved.
//

#import "BLViewController.h"
#import "BLUserService.h"
#import "NSDictionary+QueryString.h"
#import "NSString+MD5.h"

@interface BLViewController ()

@end

@implementation BLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 
    
    // Start the service
    BLUserService *userServce = [[BLUserService alloc] initWithBaseURL:@"http://staging.tapiture.com:9012"];
    
    
    /** GET Request Example **/
//    [userServce followedUsersWithUserId:[NSNumber numberWithInt:93]
//                               andStart:[NSNumber numberWithInt:1]
//                               andCount:[NSNumber numberWithInt:1]
//                                success:^(id responseObject) {
//                                    NSLog(@"%@", responseObject);
//                                } failure:^(NSError *error) {
//                                    NSLog(@"Error %@", error);
//                                }];
    
    /** POST Request Example **/
//    [userServce createCollectionWithUserId:[NSNumber numberWithInt:93]
//                                  andTitle:[NSString genRandStringLength:10]
//                                andTopicId:[NSNumber numberWithInt:2]
//                             andVisibility:@"public"
//                                   success:^(id responseObject) {
//                                       NSLog(@"%@", responseObject);
//                                   } failure:^(NSError *error) {
//                                       NSLog(@"error %@", error);
//                                   }];
    
    /** MULTIPART FORM POST Example **/
//    UIImage *myImage            = [UIImage imageNamed:@"pekkle"];
//    NSData *imageData           = UIImagePNGRepresentation(myImage);
//    
    // UIImageView Is Created For Debuggging Purposes. To show image.
//    UIImageView *imageView      = [[UIImageView alloc] initWithImage:myImage];
//    [self.view addSubview:imageView];
//
//    [userServce createFileTapWithFile:imageData
//                       andDescription:@"cool desc"
//                             andTitle:@"cool title"
//                        andVisibility:@""
//                            andUserId:[NSNumber numberWithInt:93]
//                      andCollectionId:[NSNumber numberWithInt:1000181]
//                              success:^(id responseObject) {
//                                  NSLog(@"%@", responseObject);
//                              } failure:^(NSError *error) {
//                                  NSLog(@"error %@", error);
//                              }];

    // PUT Request
    
    /** DELETE Request Example **/
//    [userServce removeCollectionWithUserId:[NSNumber numberWithInt:93]
//                           andCollectionId:[NSNumber numberWithInt:1000292]
//                                   success:^(id responseObject) {
//                                        NSLog(@"%@", responseObject);
//                                   } failure:^(NSError *error) {
//                                       NSLog(@"error %@", error);
//                                   }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
