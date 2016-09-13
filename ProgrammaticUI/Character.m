//
//  character.m
//  ProgrammaticUI
//
//  Created by Jesse Sahli on 7/12/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import "Character.h"

@implementation Character

- (instancetype)initWithName: (NSString*) name
                 imageString: (NSString*) image
{
    self = [super init];
    if (self) {
        _name = name;
        _imageString = image;
    }
    return self;
}


@end
