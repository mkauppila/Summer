//
//  InsectSpawner.m
//  Summer
//
//  Created by markus on 25.12.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "InsectSpawner.h"

#import "Insect.h"

const CGFloat spawnMargin = 50.0f;

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
	
	CGPoint position = [self generateSpawnPosition];
	Insect *insect = [[Insect alloc] initWithColor:[SKColor purpleColor] position:position];
	return insect;
}


- (CGPoint)generateSpawnPosition
{
	bool spawnRight = self.spawnCounter % 2 == 0 ? YES : NO;
	
	CGFloat x = spawnRight ? self.gameAreaSize.width + spawnMargin : -spawnMargin;;
	CGFloat y = random() % (NSUInteger)self.gameAreaSize.height;
	
	return CGPointMake(x, y);
}

@end
