//
//  RMBingAerialMapSource.m
//  MapView
//
//  Created by Zachary McCormick on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RMBingAerialMapSource.h"

@implementation RMBingAerialMapSource

-(id) init
{       
	if(self = [super init]) 
	{
		[self setMaxZoom:20];
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
	//NSString *mapExtension = @".png"; //extension
	
	//TODO what is the ?g= hanging off the end 1 or 15?
    
    //0320212302123323
    return [NSString stringWithFormat:@"http://ecn.dynamic.t3.tiles.virtualearth.net/comp/CompositionHandler/%@?mkt=en-us&it=A&shading=hill", quadKey];
    
	//return [NSString stringWithFormat:@"http://%@%d.ortho.tiles.virtualearth.net/tiles/%@%@%@?g=15", maptypeFlag, 3, maptypeFlag, quadKey, mapExtension];
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

@end
