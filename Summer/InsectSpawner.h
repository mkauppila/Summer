//
//  InsectSpawner.h
//  Summer
//
//  Created by markus on 25.12.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Insect;

@interface InsectSpawner : NSObject

- (instancetype)initWithGameSceneSize:(CGSize)areaSize;

- (Insect *)spawn;
@end
