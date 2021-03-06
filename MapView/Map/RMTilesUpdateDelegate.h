//
//  RMTilesUpdateDelegate.h
//
//  Created by Olivier Brand.
//  Copyright 2008 Spatial Networks. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RMLatLong.h"

@protocol RMTilesUpdateDelegate 

@required

- (void) regionUpdate: (RMSphericalTrapezium) region;

@end
