//
//  character.h
//  ProgrammaticUI
//
//  Created by Jesse Sahli on 7/12/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSString *textBlurb;

- (instancetype)initWithName: (NSString*) name
                 imageString: (NSString*) image;

@end
