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
@end

@implementation GameScene

- (id)initWithSize:(CGSize)size insectSpawner:(InsectSpawner *)insectSpawner;
{
	self = [super initWithSize:size];
    if (self) {
		self.insectSpawner = insectSpawner;
		
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
		for (int i = 0; i < 10; i++) {
			CGPoint position = CGPointMake(random() % 1000, random() % 1000);
			SKColor *color = i % 2 == 0 ? [SKColor blueColor] : [SKColor redColor];
			Insect *insect = [[Insect alloc] initWithColor:color position:position];
			
			[self addChild:insect.sprite];
		}
 		
		/*
        SKLabelNod
		 e *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
		
		SKSpriteNode *test = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(10.0f, 20.0f)];
		test.position = CGPointMake(100,100);
		[self addChild:test];
		*/
    }
    return self;
}

- (void)spawnInsect
{
	
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
}

@end
