//
//  GBObjectiveCParser-EnumsParsing.m
//  appledoc
//
//  Created by JJ Weber on 2/17/13.
//  Copyright (c) 2013 Gentle Bytes. All rights reserved.
//

#import "GBObjectsAssertor.h"
#import "GBObjectiveCParser.h"

@interface GBObjectiveCParserEnumsParsingTesting : GBObjectsAssertor
@end


@implementation GBObjectiveCParserEnumsParsingTesting

- (void)testParseObjectsFromString_shouldRegisterMethodDefinitionWithNoArguments {
	// setup
	GBObjectiveCParser *parser = [GBObjectiveCParser parserWithSettingsProvider:[GBTestObjectsRegistry mockSettingsProvider]];
	GBStore *store = [[GBStore alloc] init];
	// execute
	[parser parseObjectsFromString:@"@enum {Constant1 = 0, Constant2 = 0}; @typdef NSUInteger MyEnum; @end" sourceFile:@"filename.h" toStore:store];
	// verify
	GBClassData *class = [[store classes] anyObject];
	NSArray *enums = [[class enums] enums];
	assertThatInteger([enums count], equalToInteger(1));
	// [self assertMethod:[methods objectAtIndex:0] matchesInstanceComponents:@"id", @"method", nil];
}

@end
