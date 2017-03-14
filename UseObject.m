//
//  UseObject.m
//  Swift_iOS
//
//  Created by LuisX on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UseObject.h"
#import "Swift_iOS-Bridging-Header.h"

@implementation UseObject

- (void)showObjectLanage{
    NSString *string = [NSString stringWithFormat:@"%@ %@", @"hello", @"world"];
    string = string.lowercaseString;
    string = [string stringByReplacingOccurrencesOfString:@"world" withString:@"swift"];
    NSLog(@"%@", string);
}


@end
