//
//  GBEnumData.h
//  appledoc
//
//  Created by JJ Weber on 2/10/13.
//  Copyright (c) 2013 Gentle Bytes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBModelBase.h"

@interface GBEnumData : GBModelBase
///---------------------------------------------------------------------------------------
/// @name Initialization & disposal
///---------------------------------------------------------------------------------------

/** Returns autoreleased instance of the enum data from given array of components.
 
 Components array should contain all enum token, the enum constansts, type, and the enum name as the last entry. The constants are copied to `enumConstants` property, the type into the 'enumType' property and name to `enumName` property. In cases where the enum type is the same as the enum name, these properties will be identical. 
 
 @param components Components array to setup the data from.
 @return Returns initialized instance.
 @exception NSException Thrown if the given array of components is `nil` or has only one entry.
 */
+ (id)enumDataWithConstants:(NSArray *)constants type:(NSString *)type name:(NSString *)name;

/** Initializes the enum data from given array of components.
 
 Components array should contain all enum type tokens and enum name as the last entry. Types are copied to `enumTypes` property and name to `enumName` property.
 
 @param components Components array to setup the data from.
 @return Returns initialized instance.
 @exception NSException Thrown if the given array of components is `nil` or has only one entry.
 */
- (id)initWithConstants:(NSArray *)constants type:(NSString *)type name:(NSString *)name;

///---------------------------------------------------------------------------------------
/// @name Ivar data
///---------------------------------------------------------------------------------------

/** The name of the enum. */
@property (retain) NSString *nameOfEnum;

/** The type of the enum. */
@property (retain) NSString *typeOfEnum;

/** The constants declared in the enum */
@property (retain) NSArray *constantsOfEnum;

@end
