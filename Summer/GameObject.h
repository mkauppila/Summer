//
//  GameObject.h
//  Summer
//
//  Created by markus on 23.12.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <SpriteKit/SpriteKit.h>

@interface GameObject : NSObject

@property (strong, nonatomic) SKSpriteNode *sprite;
@property (nonatomic, assign) CGPoint position;

@property (nonatomic, assign) NSInteger healthPoints;
@property (nonatomic, readonly) BOOL isAlive;

- (instancetype)initWithColor:(SKColor *)color
                     withSize:(CGSize)spriteSize
                  andPosition:(CGPoint)position;

- (void)takeDamage;

@end
