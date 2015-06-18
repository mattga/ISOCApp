//
//  ISOCGlobals.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/12/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISOCGlobals : NSObject

@property (strong, nonatomic) NSMutableArray *titles, *descriptions;
@property (strong, nonatomic) NSMutableDictionary *appContent;
@property (strong, nonatomic) NSString *confirmation;
@property (strong, nonatomic) NSDate *lastContentSync;

+(ISOCGlobals*) getVar;

@end
