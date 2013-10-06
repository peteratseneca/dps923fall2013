//
//  ImageToDataTransformer.m
//  My Profs
//
//  Created by Peter McIntyre on 2012/02/14.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ImageToDataTransformer.h"

@implementation ImageToDataTransformer {}

// We need to override four methods
// Two class methods provide status information
// Two instance methods do the value transformation (to and from)

// Enable reverse transformations
+ (BOOL)allowsReverseTransformation
{
	return YES;
}

// What is the data type?
// This method is called automatically during the transform
+ (Class)transformedValueClass
{
	return [NSData class];
}

// Transform the value (e.g. a PNG image) 
// into the type that can be stored (i.e. NSData)
// This method is called automatically during the transform
- (id)transformedValue:(id)value
{
	NSData *data = UIImagePNGRepresentation(value);
	return data;
}

// Transform the stored value (i.e. NSData) 
// into the type that we want/need (e.g. a PNG image)
// This method is called automatically during the transform
- (id)reverseTransformedValue:(id)value
{
	UIImage *uiImage = [[UIImage alloc] initWithData:value];
	return uiImage;
}

@end
