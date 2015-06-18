//
//  ISOCGlobals.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/12/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "ISOCGlobals.h"

@implementation ISOCGlobals
static ISOCGlobals *instance = nil;

+ (ISOCGlobals*)getVar {
	@synchronized(self) {
		if(instance == nil) {
			instance = [ISOCGlobals alloc];
		}
	}
	return instance;
}

@end