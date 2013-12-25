//
//  InsectSpawner.m
//  Summer
//
//  Created by markus on 25.12.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "InsectSpawner.h"

#import "Insect.h"

@implementation InsectSpawner

- (Insect *)spawn
{
	CGPoint position = CGPointMake(random() % 1000, random() % 1000);

	Insect *insect = [[Insect alloc] initWithColor:[SKColor purpleColor] position:position];
	return insect;
}


@end
