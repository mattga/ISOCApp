//
//  ISOCDataProvider.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/10/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "ISOCDataProvider.h"
#import "MGConnection.h"
#import "Constants.h"
#import "ISOCGlobals.h"

@implementation ISOCDataProvider
static ISOCGlobals *globals;

+ (void)init {
	globals = [ISOCGlobals getVar];
}

+ (void)fetchStaticValue:(NSString*)_id callback:(void (^)(NSArray *o, NSError* err))block {
	NSString *url = nil;
	
	url = [NSString stringWithFormat:@"%@://%@/%@/%@", kISOCRamadanWebProtocol, kISOCRamadanWebHost, kISOCRamadanWebUri, kISOCRamadanQuery];
	
	if (_id != nil) {
		url = [NSString stringWithFormat:@"%@?id=%@", url, _id];
	}
	
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	
	MGConnection *connection = [[MGConnection alloc] initWithRequest:request];
	[connection setCompletionBlock:block];
	
	[connection startSync];
}

+ (void)fetchStaticValueAsync:(NSString*)_id callback:(void (^)(NSArray *o, NSError* err))block {
	NSString *url = nil;
	
	url = [NSString stringWithFormat:@"%@://%@/%@/%@", kISOCRamadanWebProtocol, kISOCRamadanWebHost, kISOCRamadanWebUri, kISOCRamadanQuery];
	
	if (_id != nil) {
		url = [NSString stringWithFormat:@"%@?id=%@", url, _id];
	}
	
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	
	MGConnection *connection = [[MGConnection alloc] initWithRequest:request];
	[connection setCompletionBlock:block];
	
	[connection start];
}

+ (void)putStaticValue:(NSString *)_id value:(NSString *)value callback:(void (^)(id, NSError *))block {
	NSString *url = nil;
	
	url = [NSString stringWithFormat:@"%@://%@/%@/%@", kISOCRamadanWebProtocol, kISOCRamadanWebHost, kISOCRamadanWebUri, kISOCRamadanUpdate];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	
	NSString *post = [NSString stringWithFormat:@"keyfield=%@&text=%@", _id, value];
	NSData *postData = [NSData dataWithBytes:[post UTF8String] length:[post length]];
	
	NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"editApp", @"woodlawn42"];
	NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
	NSString *authValue = [authData base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
	[request setHTTPBody:postData];
	[request setValue:[NSString stringWithFormat:@"Basic %@", authValue] forHTTPHeaderField:@"Authorization"];
	
	MGConnection *connection = [[MGConnection alloc] initWithRequest:request];
	[connection setCompletionBlock:block];
	
	[connection startSync];
}

+ (void)putJoinCommittee:(NSDictionary*)info callback:(void (^)(id, NSError *))block {
	NSString *url = nil;
	
	url = [NSString stringWithFormat:@"%@://%@/%@/%@", kISOCRamadanWebProtocol, kISOCRamadanWebHost, kISOCRamadanWebUri, kISOCRamadanJoinCommittee];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	__block NSString *post = @"";
	[info enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		post = [NSString stringWithFormat:@"%@&%@=%@", post, key, obj];
	}];
	post = [post substringFromIndex:1];
	NSData *postData = [NSData dataWithBytes:[post UTF8String] length:[post length]];
	
	NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"editApp", @"woodlawn42"];
	NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
	NSString *authValue = [authData base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
	[request setHTTPBody:postData];
	[request setValue:[NSString stringWithFormat:@"Basic %@", authValue] forHTTPHeaderField:@"Authorization"];
	
	MGConnection *connection = [[MGConnection alloc] initWithRequest:request];
	[connection setCompletionBlock:block];
	
	[connection startSync];
}

+ (void)putInPersonPayment:(NSDictionary*)info callback:(void (^)(id, NSError *))block {
	__block NSString *url = nil;
	url = [NSString stringWithFormat:@"%@://%@/%@/%@", kISOCRamadanWebProtocol, kISOCRamadanWebHost, kISOCRamadanWebUri, kISOCRamadanPayInPerson];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	__block BOOL first = YES;
	[info enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		if (first) {
			url = [NSString stringWithFormat:@"%@?%@=%@", url, key, obj];
			first = NO;
		} else {
			url = [NSString stringWithFormat:@"%@&%@=%@", url, key, obj];
		}
	}];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
	
	MGConnection *connection = [[MGConnection alloc] initWithRequest:request];
	[connection setCompletionBlock:block];
	
	[connection startSync];
}

+ (NSString*)valueForKey:(NSString*)key {
	__block NSString *value = [globals.appContent objectForKey:key];
	if (!value) {
		[ISOCDataProvider fetchStaticValue:key
								  callback:^(NSArray *o, NSError *err) {
									  value = [o.firstObject valueForKey:key];
									  [self setString:value forKey:key];
								  }];
	}
	
	return value;
}

+ (void)fetchTodayISOCContent {
	NSString *key;
	for (int day = 1; day < 30; day++) {
		key = [NSString stringWithFormat:@"fastBegins%d", day];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"fastEnds%d", day];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"menu%d_line1", day];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"menu%d_line2", day];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"menu%d_line3", day];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"menu%d_line4", day];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"tarawihStart%d", day];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"khatiraGiver%d", day];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"tafseerGiver%d", day];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"specialEvents1_%d", day];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"specialEvents1_%d", day];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		if (day % 7 == 3) {
			key = [NSString stringWithFormat:@"khutbahGiver%d", day/7+1];
			[ISOCDataProvider fetchStaticValueAsync:key
										   callback:^(NSArray *o, NSError *err) {
											   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
										   }];
		}
	}
}

+ (void)fetchMenuAndEvents {
	NSString *key;
	for (int i = 1; i < 30; i++) {
		key = [NSString stringWithFormat:@"menu%d_line1", i];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"menu%d_line2", i];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"menu%d_line3", i];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"menu%d_line4", i];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"specialEvents1_%d", i];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
		key = [NSString stringWithFormat:@"specialEvents2_%d", i];
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
	}
}

+ (void)fetchAppContent {
	globals.titles = [@[@"",@"",@"",@"",@"",@"",@"",@"",@"",@""] mutableCopy];
	globals.descriptions = [@[@"",@"",@"",@"",@"",@"",@"",@"",@"",@""] mutableCopy];
	
	for (int i = 0; i < 10; i++) {
		[ISOCDataProvider fetchStaticValueAsync:[NSString stringWithFormat:@"Committee%d", i+1]
									   callback:^(NSArray *o, NSError *err) {
										   [globals.titles setObject:[o.firstObject valueForKey:@"text"] atIndexedSubscript:i];
									   }];
		[ISOCDataProvider fetchStaticValueAsync:[NSString stringWithFormat:@"CommitteeDesc%d", i+1]
									   callback:^(NSArray *o, NSError *err) {
										   [globals.descriptions setObject:[o.firstObject valueForKey:@"text"] atIndexedSubscript:i];
									   }];
	}
	for (NSString *key in [globals.appContent allKeys]) {
		[ISOCDataProvider fetchStaticValueAsync:key
									   callback:^(NSArray *o, NSError *err) {
										   [self setString:[o.firstObject valueForKey:@"text"] forKey:key];
									   }];
	}
}

+ (void)setString:(NSString*)text forKey:(NSString*)key {
	if (text != nil)
		[globals.appContent setObject:text forKey:key];
}

+ (void)initAppContent {
	globals.appContent = [@{@"AppTitle" : @"",
							@"timetableURL" : @"",
							@"programsURL" : @"",
							@"menuURL" : @"",
							@"payInPersonMsg" : @"",
							@"banquetTitle" : @"",
							@"banquetDesc" : @"",
							@"banquetDate" : @"",
							@"banquetLoc" : @"",
							@"banquetSched1" : @"",
							@"banquetSched2" : @"",
							@"banquetSched3" : @"",
							@"banquetSched4" : @"",
							@"banquetPostCCpayment" : @"",
							@"banquetInPersonPayment" : @"",
							@"pow1kCurSponsors" : @"",
							@"sponsorProject1" : @"",
							@"sponsorProject2" : @"",
							@"sponsorProject3" : @"",
							@"sponsorProject4" : @"",
							@"sponsorProject5" : @"",
							@"sponsorProject6" : @"",
							@"sponsorProject7" : @"",
							@"sponsorProject8" : @"",
							@"gasBillAmt" : @"",
							@"waterBillAmt" : @"",
							@"trashBillAmt" : @"",
							@"elecBillAmt" : @"",
							@"pow1kPostCCpayment" : @"",
							@"pow1kPostPayInPerson" : @"",
							@"zakatDesc" : @"",
							@"zakatPostCCpayment" : @"",
							@"zakatPostPayInPerson" : @"",
							@"generalPostCCpayment" : @"",
							@"generalPostPayInPerson" : @"",
							@"Committee1" : @"",
							@"CommitteeDesc1" : @"",
							@"Committee2" : @"",
							@"CommitteeDesc2" : @"",
							@"Committee3" : @"",
							@"CommitteeDesc3" : @"",
							@"Committee4" : @"",
							@"CommitteeDesc4" : @"",
							@"Committee5" : @"",
							@"CommitteeDesc5" : @"",
							@"Committee6" : @"",
							@"CommitteeDesc6" : @"",
							@"Committee7" : @"",
							@"CommitteeDesc7" : @"",
							@"Committee8" : @"",
							@"CommitteeDesc8" : @"",
							@"Committee9" : @"",
							@"CommitteeDesc9" : @"",
							@"Committee10" : @"",
							@"CommitteeDesc10" : @"",
							@"postJoinMsg" : @"",
							@"fitrPostCCpayment" : @"",
							@"fitrPostPayInPerson" : @"",
							@"eidTitle" : @"",
							@"eidDate" : @"",
							@"eidLoc" : @"",
							@"eidPrayerTime" : @"",
							@"eidInstruct1" : @"",
							@"eidInstruct2" : @"",
							@"eidInstruct3" : @"",
							@"eidInstruct4" : @"",
							@"donationPageURL" : @"http://www.isocmasjid.org/ramadanapp/isocmobile/donate.php",
							@"40x40_1" : @"Be one of the 40 people to donate $2,500.",
							@"40x40_amt" : @"0"} mutableCopy];
}



@end
