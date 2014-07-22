//
//  MyScene.h
//  Summer
//
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class GameObjectSpawner;

@interface GameScene : SKScene

- (instancetype)initWithSize:(CGSize)size gameObjectSpawner:(GameObjectSpawner *)gameObjectSpawner NS_DESIGNATED_INITIALIZER;

@end
