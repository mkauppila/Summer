//
//  Insect.h
//  Summer
//
//  Created by markus on 23.12.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "GameObject.h"

#import <SpriteKit/SpriteKit.h>

@interface Insect : GameObject
- (instancetype)initWithColor:(SKColor *)color
					 withSize:(CGSize)spriteSize
				  andPosition:(CGPoint)position;

- (void)setPosition:(CGPoint)position;
@end
