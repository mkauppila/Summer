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
@end

@implementation GameScene

- (id)initWithSize:(CGSize)size insectSpawner:(InsectSpawner *)insectSpawner;
{
	self = [super initWithSize:size];
    if (self) {
		self.insectSpawner = insectSpawner;
		
		self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
		self.insects = [NSMutableArray new];
		
		for (int i = 0; i < 10; i++) {
			Insect *insect = [self.insectSpawner spawn];
			[self.insects addObject:insect];
			[self addChild:insect.sprite];
		}
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
	*/
}

- (void)update:(CFTimeInterval)currentTime
{
	const CGPoint center = CGPointMake(self.size.width / 2.0f, self.size.height / 2.0f);
	
	[self.insects enumerateObjectsUsingBlock:^(Insect *insect, NSUInteger idx, BOOL *stop) {
		NSLog(@"handling insect number: %d", idx);

		CGPoint position = [insect position];
		
		CGPoint difference = CGPointSubtract(center, position);
		CGFloat length = CGPointLength(difference);

		difference.x = difference.x / length;
		difference.y = difference.y / length;
		
		CGPoint newPosition = CGPointAdd(position, difference);
		[insect setPosition:newPosition];
	}];
}

@end
