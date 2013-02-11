//
//  GBEnumData.m
//  appledoc
//
//  Created by JJ Weber on 2/10/13.
//  Copyright (c) 2013 Gentle Bytes. All rights reserved.
//

#import "GBEnumData.h"

@implementation GBEnumData

#pragma mark Initialization & disposal

+ (id)enumDataWithConstants:(NSArray *)constants type:(NSString *)type name:(NSString *)name {
	return [[[self alloc] initWithConstants:constants type:type name:name] autorelease];
}

- (id)initWithConstants:(NSArray *)constants type:(NSString *)type name:(NSString *)name {
	NSParameterAssert(constants != nil);
    NSParameterAssert(type != nil);
    NSParameterAssert(name != nil);
	self = [super init];
	if (self) {
		
		self.nameOfEnum = name;
	}
	return self;
}

#pragma mark Overriden methods

- (void)mergeDataFromObject:(id)source {
	if (!source || source == self) return;
	GBLogDebug(@"%@: Merging data from %@...", self, source);
	NSParameterAssert([[source nameOfEnum] isEqualToString:self.nameOfEnum]);
	NSParameterAssert([[source typeOfEnum] isEqualToString:self.typeOfEnum]);
    NSParameterAssert([[source constantsOfEnum] isEqualToArray:self.constantsOfEnum]);
	[super mergeDataFromObject:source];
}

- (NSString *)description {
	if (self.parentObject)
		return [NSString stringWithFormat:@"%@.%@", self.parentObject, self.nameOfEnum];
	return self.nameOfEnum;
}

@end
