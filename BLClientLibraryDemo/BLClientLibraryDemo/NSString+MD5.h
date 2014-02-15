//
//  NSString+MD5.h
//  AFNetworkTest
//
//  Created by Bennett Lee on 2/12/14.
//  Copyright (c) 2014 Bennett Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

+ (NSString *) genRandStringLength: (int) len;
- (NSString *) MD5String;

@end
