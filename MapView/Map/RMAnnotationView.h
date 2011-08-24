//
//  RMAnnotationView.h
//  Maptual
//
//  Created by Zac McCormick on 8/24/11.
//  Copyright 2011 Spatial Networks. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RMAnnotationView : UIView {
    UILabel *titleLabel;
    UILabel *subtitleLabel;
    UIImageView* leftImageView;
    UIImageView* leftMiddleImageView;
    UIImageView* middleTopImageView;
    UIImageView* middleBottomImageView;
    UIImageView* rightMiddleImageView;
    UIImageView* rightImageView;
    UIImageView* disclosureImage;
    CGPoint markerPoint;
}

- (id)initWithTitles:(NSString *)title subtitle:(NSString *)subtitle atLocation:(float)x y:(float)y;
- (id)initWithLocation:(float)x y:(float)y;
- (void)setLocation:(float)x y:(float)y;
- (void)setTitles:(NSString *)title subtitle:(NSString *)subtitle;
@end
