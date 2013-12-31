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
	self = [super init];
	if (self) {
		self.sprite = [SKSpriteNode spriteNodeWithColor:color size:spriteSize];
		[self setPosition:position];
		self.hasEaten = NO;
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