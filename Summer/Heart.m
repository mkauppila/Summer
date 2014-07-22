//
//  Heart.m
//  Summer
//
//  Created by Markus Kauppila on 21/07/14.
//  Copyright (c) 2014 Markus Kauppila. All rights reserved.
//

#import "Heart.h"

@implementation Heart

- (instancetype)initWithColor:(UIColor *)color withSize:(CGSize)spriteSize andPosition:(CGPoint)position
{
    self = [super initWithColor:color withSize:spriteSize andPosition:position];
    if (!self) return nil;
    
    self.healthPoints = 3;
    
    return self;
}


@end
