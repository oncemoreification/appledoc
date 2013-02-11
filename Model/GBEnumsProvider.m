//
//  GBEnumsProvider.m
//  appledoc
//
//  Created by JJ Weber on 2/10/13.
//  Copyright (c) 2013 Gentle Bytes. All rights reserved.
//

#import "GBEnumsProvider.h"
#import "GBEnumData.h"

@implementation GBEnumsProvider

#pragma mark Initialization & disposal

- (id)initWithParentObject:(id)parent {
    NSParameterAssert(parent != nil);
	GBLogDebug(@"Initializing enums provider for %@...", parent);
	self = [super init];
	if (self) {
		_parent = [parent retain];
		_enums = [[NSMutableArray alloc] init];
		_enumsByName = [[NSMutableDictionary alloc] init];
	}
	return self;
}

#pragma mark Helper methods

- (void)registerIvar:(GBEnumData *)enumerable {
	NSParameterAssert(enumerable != nil);
	GBLogDebug(@"%@: Registering enum %@...", _parent, enumerable);
	if ([_enums containsObject:enumerable]) return;
	GBEnumData *existingEnum = [_enumsByName objectForKey:enumerable.nameOfEnum];
	if (existingEnum) {
		[existingEnum mergeDataFromObject:enumerable];
		return;
	}
	enumerable.parentObject = _parent;
	[_enums addObject:enumerable];
	[_enumsByName setObject:enumerable forKey:enumerable.nameOfEnum];
}

- (void)mergeDataFromIvarsProvider:(GBEnumsProvider *)source {
	if (!source || source == self) return;
	GBLogDebug(@"%@: Merging enums from %@...", _parent, source->_parent);
	for (GBEnumData *sourceEnum in source.enums) {
		GBEnumData *existingEnum = [_enumsByName objectForKey:sourceEnum.nameOfEnum];
		if (existingEnum) {
			[existingEnum mergeDataFromObject:sourceEnum];
			continue;
		}
		[self registerIvar:sourceEnum];
	}
}

#pragma mark Overriden methods

- (NSString *)description {
	return [_parent description];
}

@end
