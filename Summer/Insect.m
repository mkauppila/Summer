//
//  Insect.m
//  Summer
//
//  Created by markus on 23.12.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "Insect.h"

@implementation Insect

- (instancetype)initWithColor:(SKColor *)color position:(CGPoint)position
{
	self = [super init];
	if (self) {
		const CGSize spriteSize = CGSizeMake(100.0f, 100.0f);
		self.sprite = [SKSpriteNode spriteNodeWithColor:color size:spriteSize];
		[self.sprite setPosition:position];
	}
	return self;
}


@end
