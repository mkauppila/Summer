//
//  MyScene.m
//  Summer
//
//  Created by markus on 22.12.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "GameScene.h"

#import "Heart.h"
#import "Insect.h"
#import "GameObjectSpawner.h"

@interface GameScene ()

@property (strong, nonatomic) GameObjectSpawner *insectSpawner;
@property (strong, nonatomic) NSMutableArray *insects;

@property (strong, nonatomic) Heart *heart;

@end

@implementation GameScene

- (instancetype)initWithSize:(CGSize)size insectSpawner:(GameObjectSpawner *)insectSpawner;
{
	self = [super initWithSize:size];
    if (self) {
		self.insectSpawner = insectSpawner;
		
		const CGPoint center = CGPointMake(self.size.width / 2.0f, self.size.height / 2.0f);
		const CGSize heartSize = CGSizeMake(92.0f, 92.0f);
        const CGRect heartFrame = CGRectMake(center.x - heartSize.width / 2.0f,
                                             center.y - heartSize.height /  2.0f,
                                             heartSize.width,
                                             heartSize.height);
        NSLog(@"heart frame: %@", CGRectToString(heartFrame));
        
        self.heart = [[Heart alloc] initWithColor:[SKColor redColor]
                                         withSize:heartFrame.size
                                      andPosition:heartFrame.origin];
        [self addChild:self.heart.sprite];
        
		self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
		self.insects = [NSMutableArray new];
		for (int i = 0; i < 10; i++) {
			[self spawnInsect];
		}
    }
    return self;
}

- (void)spawnInsect
{
	Insect *insect = [self.insectSpawner spawn];
	[self.insects addObject:insect];
	[self addChild:insect.sprite];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSMutableArray *deadInsects = [NSMutableArray array];
    
    for (UITouch *touch in touches) {
        CGPoint touchPoint = [touch locationInNode:self];
        
        [self.insects enumerateObjectsUsingBlock:^(Insect *insect, NSUInteger idx, BOOL *stop) {
            if (CGRectContainsPoint(insect.sprite.frame, touchPoint)) {
                NSLog(@"touching a insect! Destroy it!!");
                [deadInsects addObject:insect];
            }
        }];
    }
    
    for (Insect *corpse in deadInsects) {
        [corpse.sprite removeFromParent];
        [self.insects removeObject:corpse];
    }
}

- (void)update:(CFTimeInterval)currentTime
{
	const CGPoint center = CGPointMake(CGRectGetMidX(self.heart.sprite.frame),
									   CGRectGetMidY(self.heart.sprite.frame));
	
	[self.insects enumerateObjectsUsingBlock:^(Insect *insect, NSUInteger idx, BOOL *stop) {
		if ([insect hasEaten] == NO) {
			CGPoint position = [insect position];
			CGPoint direction = CGPointNormalize(CGPointSubtract(center, position));
			CGPoint newPosition = CGPointAdd(position, direction);
			[insect setPosition:newPosition];
			
			if (CGRectContainsPoint(self.heart.sprite.frame, newPosition)) {
				insect.sprite.color = [SKColor redColor];
				[insect setHasEaten:YES];
			}
		} else {
			CGPoint position = [insect position];
			CGPoint direction = CGPointMake(1.0f, 0.0f);
			CGPoint newPosition = CGPointAdd(position, direction);
			[insect setPosition:newPosition];
		}
	}];
}

@end
