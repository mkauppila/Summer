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
@end

@implementation InsectSpawner

- (instancetype)init
{
	self = [super init];
	if (self) {
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
	
	CGFloat x = spawnRight ? 1200 : -100;
	CGFloat y = random() % 768;
	
	return CGPointMake(x, y);
}

@end
