//
//  NSDictionary+UrlEncoding.m
//  AFNetworkTest
//
//  Created by Bennett Lee on 2/12/14.
//  Copyright (c) 2014 Bennett Lee. All rights reserved.
//

#import "NSDictionary+QueryString.h"

// helper function: get the string form of any object
static NSString *toString(id object) {
    return [NSString stringWithFormat: @"%@", object];
}

// helper function: get the url encoded string form of any object
static NSString *urlEncode(id object) {
    NSString *string = toString(object);
//    return [string stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    NSString *charactersToEscape = @"!*'();:@&=+$,/?%#[]\" ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodedString = [string stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    return encodedString;
}

@implementation NSDictionary (QueryString)

-(NSString*) queryString {
    NSMutableArray *parts = [NSMutableArray array];
    for (id key in self) {
        id value = [self objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
        [parts addObject: part];
    }
    return [parts componentsJoinedByString: @"&"];
}
@end

