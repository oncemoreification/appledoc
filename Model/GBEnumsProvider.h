//
//  GBEnumsProvider.h
//  appledoc
//
//  Created by JJ Weber on 2/10/13.
//  Copyright (c) 2013 Gentle Bytes. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GBEnumData;

/** A helper class that unifies ivars handling.
 
 Dividing implementation of enums provider to a separate class allows us to abstract the logic and reuse it within any object that needs to handle enums using composition. This breaks down the code into simpler and more managable chunks. It also simplifies enum parsing and handling. To use the class, simply "plug" it to the class that needs to handle enums and provide access through public interface.
 
 The downside is that querying code becomes a bit more verbose as another method or property needs to be sent before getting access to actual ivars data.
 */
@interface GBEnumsProvider : NSObject {
@private
	NSMutableArray *_enums;
	NSMutableDictionary *_enumsByName;
	id _parent;
}

///---------------------------------------------------------------------------------------
/// @name Initialization & disposal
///---------------------------------------------------------------------------------------

/** Initializes enums provider with the given parent object.
 
 The given parent object is set to each `GBEnumData` registered through `registerEnum:`. This is the designated initializer.
 
 @param parent The parent object to be used for all registered ivars.
 @return Returns initialized object.
 @exception NSException Thrown if the given parent is `nil`.
 */
- (id)initWithParentObject:(id)parent;

///---------------------------------------------------------------------------------------
/// @name Enums handling
///---------------------------------------------------------------------------------------

/** Registers the given enums to the providers data.
 
 If provider doesn't yet have the given enum instance registered, the object is added to `enums` list. If the same object is already registered, nothing happens.
 
 @warning *Note:* If another instance of the enum with the same name is registered, an exception is thrown.
 
 @param enum The enum to register.
 @exception NSException Thrown if the given ivar is already registered.
 */
- (void)registerIvar:(GBEnumData *)enumerable;

/** Merges data from the given enums provider.
 
 This copies all unknown eums from the given source to receiver and invokes merging of data for receivers enums also found in source. It leaves source data intact.
 
 @param source `GBEnumsProvider` to merge from.
 */
- (void)mergeDataFromIvarsProvider:(GBEnumsProvider *)source;

/** The array of all registered ivars as `GBEnumData` instances in the order of registration. */
@property (readonly) NSArray *enums;

@end
