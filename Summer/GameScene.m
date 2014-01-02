//
//  MyScene.m
//  Summer
//
//  Created by markus on 22.12.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "GameScene.h"

#import "Insect.h"
#import "InsectSpawner.h"

@interface GameScene ()

@property (strong, nonatomic) InsectSpawner *insectSpawner;

@property (strong, nonatomic) NSMutableArray *insects;

@property (assign, nonatomic) CGRect heartFrame;
@end

@implementation GameScene

- (id)initWithSize:(CGSize)size insectSpawner:(InsectSpawner *)insectSpawner;
{
	self = [super initWithSize:size];
    if (self) {
		self.insectSpawner = insectSpawner;
		
		const CGPoint center = CGPointMake(self.size.width / 2.0f, self.size.height / 2.0f);
		const CGSize heartSize = CGSizeMake(92.0f, 92.0f);
		self.heartFrame = CGRectMake(center.x - heartSize.width / 2.0f,
									 center.y - heartSize.height /  2.0f,
									 heartSize.width,
									 heartSize.height);
		NSLog(@"heart frame: %@", CGRectToString(self.heartFrame));
		
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
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
	const CGPoint center = CGPointMake(CGRectGetMidX(self.heartFrame),
									   CGRectGetMidY(self.heartFrame));
	
	[self.insects enumerateObjectsUsingBlock:^(Insect *insect, NSUInteger idx, BOOL *stop) {
		CGPoint position = [insect position];
		CGPoint direction = CGPointNormalize(CGPointSubtract(center, position));
		CGPoint newPosition = CGPointAdd(position, direction);
		[insect setPosition:newPosition];
		
		if (CGRectContainsPoint(self.heartFrame, newPosition)) {
			insect.sprite.color = [SKColor redColor];
		}
	}];
}

@end
