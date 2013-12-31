//
//  InsectSpawner.m
//  Summer
//
//  Created by markus on 25.12.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "InsectSpawner.h"

#import "Insect.h"

@interface InsectSpawner ()
@property (assign, nonatomic) NSUInteger spawnCounter;
@property (assign, nonatomic) CGSize gameAreaSize;
@end

@implementation InsectSpawner

- (instancetype)initWithGameSceneSize:(CGSize)areaSize
{
	self = [super init];
	if (self) {
		self.gameAreaSize = areaSize;
		self.spawnCounter = 0;
	}
	return self;
}

- (Insect *)spawn
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
	CGFloat x = spawnRight ? self.gameAreaSize.width + spawnMargin : -spawnMargin;;
	CGFloat y = random() % (NSUInteger)self.gameAreaSize.height;
	
	return CGPointMake(x, y);
}

@end
