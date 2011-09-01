//
//  RMMapQuestOSMSource.m
//
// Copyright (c) 2008-2011, Route-Me Contributors
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

#import "RMMapQuestOSMSource.h"

@implementation RMMapQuestOSMSource

-(id) init
{       
	if(self = [super init]) 
	{
		[self setMaxZoom:18];
		[self setMinZoom:1];
	}
	return self;
} 

-(NSString*) tileURL: (RMTile) tile
{
	NSAssert4(((tile.zoom >= self.minZoom) && (tile.zoom <= self.maxZoom)),
			  @"%@ tried to retrieve tile with zoomLevel %d, outside source's defined range %f to %f", 
			  self, tile.zoom, self.minZoom, self.maxZoom);
	return [NSString stringWithFormat:@"http://otile1.mqcdn.com/tiles/1.0.0/osm/%d/%d/%d.png", tile.zoom, tile.x, tile.y];
}
	
-(NSString*) uniqueTilecacheKey
{
	return @"MapQuestOSM";
}

-(NSString *)shortName
{
	return @"MapQuest";
}
-(NSString *)longDescription
{
	return @"Map tiles courtesy of MapQuest.";
}
-(NSString *)shortAttribution
{
	return @"Tiles courtesy of MapQuest.";
}
-(NSString *)longAttribution
{
//	return @"Tiles courtesy of <a href=\"http://www.mapquest.com\" target=\"_blank\">MapQuest</a> and <a href=\"http://www.openstreetmap.org\" target=\"_blank\">OpenStreetMap</a> contributors.";
    return @"Tiles courtesy of MapQuest and OpenStreetMap contributors.";
}

@end
