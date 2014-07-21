//
//  Heart.h
//  Summer
//
//  Created by Markus Kauppila on 21/07/14.
//  Copyright (c) 2014 Markus Kauppila. All rights reserved.
//

#import "GameObject.h"

@interface Heart : GameObject

// TODO lift to super class
@property (nonatomic, assign) CGPoint position;

// TODO lift to super class
- (instancetype)initWithColor:(SKColor *)color
                     withSize:(CGSize)spriteSize
                  andPosition:(CGPoint)position;


@end
