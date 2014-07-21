//
//  Heart.m
//  Summer
//
//  Created by Markus Kauppila on 21/07/14.
//  Copyright (c) 2014 Markus Kauppila. All rights reserved.
//

#import "Heart.h"

@implementation Heart

- (instancetype)initWithColor:(SKColor *)color
                     withSize:(CGSize)spriteSize
                  andPosition:(CGPoint)position
{
    self = [super init];
    if (self) {
        self.sprite = [SKSpriteNode spriteNodeWithColor:color size:spriteSize];
        [self setPosition:position];
    }
    return self;
}

- (void)setPosition:(CGPoint)position;
{
    [self.sprite setPosition:position];
}

- (CGPoint)position
{
    return self.sprite.position;
}


@end
