//
//  InsectSpawner.m
//  Summer
//
//  Created by markus on 25.12.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "GameObjectSpawner.h"

#import "Insect.h"
#import "Heart.h"

@interface GameObjectSpawner ()
@property (assign, nonatomic) NSUInteger spawnCounter;
@property (assign, nonatomic) CGSize gameAreaSize;
@end

@implementation GameObjectSpawner

- (instancetype)initWithGameSceneSize:(CGSize)areaSize
{
	self = [super init];
	if (self) {
		self.gameAreaSize = areaSize;
		self.spawnCounter = 0;
	}
	return self;
}

#pragma mark - Spawn heart

- (Heart *)spawnBasicHeart
{
    const CGPoint center = CGPointMake(self.gameAreaSize.width / 2.0f,
                                       self.gameAreaSize.height / 2.0f);
    const CGSize heartSize = CGSizeMake(92.0f, 92.0f);
    
    Heart *heart = [[Heart alloc] initWithColor:[SKColor redColor]
                                       withSize:heartSize
                                    andPosition:center];
    return heart;
}


#pragma mark - Spawn insects

- (Insect *)spawnBasicInsect
{
	self.spawnCounter++;
	
	const CGSize spriteSize = CGSizeMake(30.0f, 30.0f);
	
	CGPoint position = [self generateSpawnPositionForSize:spriteSize];
	Insect *insect = [[Insect alloc] initWithColor:[SKColor whiteColor]
										  withSize:spriteSize
									   andPosition:position];
	return insect;
}

- (CGPoint)generateSpawnPositionForSize:(CGSize)spriteSize;
{
	bool spawnRight = self.spawnCounter % 2 == 0 ? YES : NO;
	
	const CGFloat spawnMargin = spriteSize.width + 1;
	CGFloat x = spawnRight ? self.gameAreaSize.width + spawnMargin : -spawnMargin;
	CGFloat y = arc4random() % (NSUInteger)self.gameAreaSize.height;
	
	return CGPointMake(x, y);
}

@end
