//
//  RMBingAerialMapSource.m
//  MapView
//
//  Created by Zachary McCormick on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RMBingAerialMapSource.h"

@implementation RMBingAerialMapSource
@synthesize token = _token;

-(id) init
{       
	if(self = [super init]) 
	{
		[self setMaxZoom:21];
		[self setMinZoom:1];
	}
	return self;
} 

-(NSString*) tileURL: (RMTile) tile
{
	NSString *quadKey = [self quadKeyForTile:tile];
	return [self urlForQuadKey:quadKey];
}

-(NSString*) quadKeyForTile: (RMTile) tile
{
	NSAssert4(((tile.zoom >= self.minZoom) && (tile.zoom <= self.maxZoom)),
			  @"%@ tried to retrieve tile with zoomLevel %d, outside source's defined range %f to %f", 
			  self, tile.zoom, self.minZoom, self.maxZoom);
	NSMutableString *quadKey = [NSMutableString string];
	for (int i = tile.zoom; i > 0; i--)
	{
		int mask = 1 << (i - 1);
		int cell = 0;
		if ((tile.x & mask) != 0)
		{
			cell++;
		}
		if ((tile.y & mask) != 0)
		{
			cell += 2;
		}
		[quadKey appendString:[NSString stringWithFormat:@"%d", cell]];
	}
	return quadKey;
}

-(NSString*) urlForQuadKey: (NSString*) quadKey 
{
    if (self.token) {
        return [NSString stringWithFormat:@"http://ecn.t1.tiles.virtualearth.net/tiles/a%@.jpeg?g=1038&token=%@", quadKey, self.token];
    } else {
        return [NSString stringWithFormat:@"http://ecn.t1.tiles.virtualearth.net/tiles/a%@.jpeg?g=1038", quadKey];
    }
}

-(NSString*) uniqueTilecacheKey
{
	return @"BingAerial%@";
}

-(NSString *)shortName
{
	return @"Bing Maps";
}

-(NSString *)longDescription
{
	return @"Microsoft Bing. All data © Microsoft or their licensees.";
}
-(NSString *)shortAttribution
{
	return @"© Microsoft Bing";
}
-(NSString *)longAttribution
{
	return @"Map data © Microsoft Bing.";
}

- (void)dealloc {
    self.token = nil;
    [super dealloc];
}
@end
