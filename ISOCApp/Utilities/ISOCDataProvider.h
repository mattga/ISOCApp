//
//  ISOCDataProvider.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/10/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISOCDataProvider : NSObject

+ (void)fetchStaticValue:(NSString*)_id callback:(void (^)(NSArray *o, NSError* err))block;
+ (void)fetchStaticValueAsync:(NSString*)_id callback:(void (^)(NSArray *o, NSError* err))block;
+ (void)putStaticValue:(NSString*)_id value:(NSString*)value callback:(void (^)(id o, NSError *err))block;
+ (void)putJoinCommittee:(NSDictionary*)info callback:(void (^)(id o, NSError *err))block;
+ (void)putInPersonPayment:(NSDictionary*)info callback:(void (^)(id o, NSError *err))block;
+ (void)fetchTodayISOCContent;
+ (void)fetchMenuAndEvents;
+ (void)fetchAppContent;
+ (void)initAppContent;
+ (NSString*)valueForKey:(NSString*)key;

@end
