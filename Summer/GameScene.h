//
//  MyScene.h
//  Summer
//
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class InsectSpawner;

@interface GameScene : SKScene

- (instancetype)initWithSize:(CGSize)size insectSpawner:(InsectSpawner *)insectSpawner NS_DESIGNATED_INITIALIZER;

@end
