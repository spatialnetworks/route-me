//
//  RMAnnotationView.h
//  Maptual
//
//  Created by Zac McCormick on 8/24/11.
//  Copyright 2011 Spatial Networks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMMarker.h"

@interface RMAnnotationView : UIView {
    RMMarker *_marker;
    UILabel *titleLabel;
    UILabel *subtitleLabel;
    UIImageView* leftImageView;
    UIImageView* leftMiddleImageView;
    UIImageView* middleTopImageView;
    UIImageView* middleBottomImageView;
    UIImageView* rightMiddleImageView;
    UIImageView* rightImageView;
    UIImageView* disclosureImage;
    float _contentWidth;
}

@property (readwrite, retain) UIButton *accessoryButton;

- (id)initWithFrame:(CGRect)frame;
- (void)configureSubviews;
- (void)setMarker:(RMMarker *)marker 
            title:(NSString *)title 
         subtitle:(NSString *)subtitle;
- (void)moveToPoint:(CGPoint)point;

@end
