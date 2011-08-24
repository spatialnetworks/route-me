//
//  RMAnnotationView.m
//  Maptual
//
//  Created by Zac McCormick on 8/24/11.
//  Copyright 2011 Spatial Networks. All rights reserved.
//

#import "RMAnnotationView.h"
//#import "SNIDebug.h"
#import <QuartzCore/QuartzCore.h>
#define ANNOTATION_HEIGHT 57.0
#define ANNOTATION_HEIGHT_FULL 70.0

@implementation RMAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-left.png"]];
        leftMiddleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-stretch.png"]];
        middleTopImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-middle-top.png"]];
        middleBottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-middle-bottom.png"]];
        rightMiddleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-stretch.png"]];
        rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-right.png"]];
        

        [self addSubview:leftImageView];
        [self addSubview:leftMiddleImageView];
        [self addSubview:middleTopImageView];
        [self addSubview:middleBottomImageView];
        [self addSubview:rightMiddleImageView];
        [self addSubview:rightImageView];
        
        middleTopImageView.hidden = YES;
        
        [self setNeedsLayout];
    }
    return self;
}

- (void)setLocation:(float)x y:(float)y {
    markerPoint.x = x;
    markerPoint.y = y; 
    [self setNeedsLayout];
}

- (id)initWithLocation:(float)x y:(float)y
{
    markerPoint.x = x;
    markerPoint.y = y;
    
    CGRect frame = CGRectMake(x, y - 70.0 - 39.0, 180, 70);
    
    
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-left.png"]];
        leftMiddleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-stretch.png"]];
        middleTopImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-middle-top.png"]];
        middleBottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-middle-bottom.png"]];
        rightMiddleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-stretch.png"]];
        rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-right.png"]];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(18.0, 2.0, 180.0, 24.0)];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        titleLabel.shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
        titleLabel.shadowOffset = CGSizeMake(-1,-1);
        
        subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(18.0, 24.0, 180.0, 18.0)];
        subtitleLabel.textColor = [UIColor whiteColor];
        subtitleLabel.backgroundColor = [UIColor clearColor];
        subtitleLabel.font = [UIFont systemFontOfSize:12.0];
        
        //DEBUG_BORDER(titleLabel);
        //DEBUG_BORDER(subtitleLabel);
        //DEBUG_BORDER(self);
        
        
        
        [self addSubview:leftImageView];
        [self addSubview:leftMiddleImageView];
        [self addSubview:middleTopImageView];
        [self addSubview:middleBottomImageView];
        [self addSubview:rightMiddleImageView];
        [self addSubview:rightImageView];
        
        [self addSubview:titleLabel];
        [self addSubview:subtitleLabel];

        middleTopImageView.hidden = YES;
        
        [self setNeedsLayout];
    }
    
    //DEBUG_BORDER(self);
    
    return self;
}

- (id)initWithTitles:(NSString *)title subtitle:(NSString *)subtitle atLocation:(float)x y:(float)y {
    self = [self initWithLocation:x y:y];
    
    titleLabel.text = title;
    subtitleLabel.text = subtitle;
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (void)setTitles:(NSString *)title subtitle:(NSString *)subtitle {
    titleLabel.text = title;
    subtitleLabel.text = subtitle;
}


- (void)layoutSubviews {
    float contentWidth = 200.0;

    float minWidth = 75.0;
    float diff = contentWidth - minWidth;
    float leftPart = floorf(diff / 2.0);
    float rightPart = diff - leftPart;
    
    leftImageView.frame = CGRectMake(0, 0, 17.0, ANNOTATION_HEIGHT);
    leftMiddleImageView.frame = CGRectMake(leftImageView.frame.size.width, 0, leftPart, ANNOTATION_HEIGHT);
    middleTopImageView.frame = CGRectMake(leftMiddleImageView.frame.origin.x + leftMiddleImageView.frame.size.width, 0, 41.0, ANNOTATION_HEIGHT_FULL);
    middleBottomImageView.frame = CGRectMake(leftMiddleImageView.frame.origin.x + leftMiddleImageView.frame.size.width, 0, 41.0, ANNOTATION_HEIGHT_FULL);
    rightMiddleImageView.frame = CGRectMake(middleTopImageView.frame.origin.x + middleTopImageView.frame.size.width, 0, rightPart, ANNOTATION_HEIGHT);
    rightImageView.frame = CGRectMake(rightMiddleImageView.frame.origin.x + rightMiddleImageView.frame.size.width, 0, 17.0, ANNOTATION_HEIGHT);

    float totalWidth = leftImageView.frame.size.width + leftMiddleImageView.frame.size.width + middleTopImageView.frame.size.width + rightMiddleImageView.frame.size.width + rightImageView.frame.size.width;
    
    float markerPointX = markerPoint.x;
    float markerPointY = markerPoint.y;
    //NSLog(@"totalWidth: %f", totalWidth);
    
    self.frame = CGRectMake(markerPointX - (totalWidth/2.0), markerPointY - 70.0 - 29.0, totalWidth, self.bounds.size.height);
    
    //self.layer.position = CGPointMake(markerPointX, markerPointY);
    
    
    NSLog(@"frame: %@", NSStringFromCGRect(self.frame));
    
    CGRect bounds = self.bounds;
    bounds.size.width = 200.0;
    self.bounds = bounds;
}

- (void)dealloc
{
    [super dealloc];
}

@end
