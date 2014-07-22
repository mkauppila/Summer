//
//  Insect.m
//  Summer
//
//  Created by markus on 23.12.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "Insect.h"

@implementation Insect

- (instancetype)initWithColor:(SKColor *)color
					 withSize:(CGSize)spriteSize
				  andPosition:(CGPoint)position
{
	self = [super initWithColor:color withSize:spriteSize andPosition:position];
    if (!self) return nil;
    
    self.hasEaten = NO;
    self.healthPoints = 1;
    
	return self;
}

@end