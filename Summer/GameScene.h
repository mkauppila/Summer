//
//  MyScene.h
//  Summer
//
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class InsectSpawner;

@interface GameScene : SKScene
- (id)initWithSize:(CGSize)size insectSpawner:(InsectSpawner *)insectSpawner;
@end
