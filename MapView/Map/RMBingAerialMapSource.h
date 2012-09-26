//
//  RMBingAerialMapSource.h
//  MapView
//
//  Created by Zachary McCormick on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RMAbstractMercatorWebSource.h"

@interface RMBingAerialMapSource : RMAbstractMercatorWebSource <RMAbstractMercatorWebSource>

@property (readwrite, copy) NSString *token;

- (NSString *)quadKeyForTile: (RMTile) tile;
- (NSString *)urlForQuadKey: (NSString*) quadKey;

@end
