//
//  RMAnnotationView.m
//  Maptual
//
//  Created by Zac McCormick on 8/24/11.
//  Copyright 2011 Spatial Networks. All rights reserved.
//

#import "RMAnnotationView.h"
#import <QuartzCore/QuartzCore.h>

#define ANNOTATION_HEIGHT       57.0
#define ANNOTATION_HEIGHT_FULL  70.0
#define ANNOTATION_WIDTH_MIN    75.0
#define ANNOTATION_WIDTH_MAX   320.0
#define ANNOTATION_PADDING      64.0
#define ANNOTATION_IMAGE_WIDTH  41.0
#define ANNOTATION_BUTTON_SIZE  32.0

@implementation RMAnnotationView
@synthesize accessoryButton = _accessoryButton;
@synthesize offsetY = _offsetY;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.accessoryButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        self.accessoryButton.frame = CGRectZero;
        
        leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-left.png"]];
        leftMiddleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-stretch.png"]];
        middleTopImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-middle-top.png"]];
        middleBottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-middle-bottom.png"]];
        rightMiddleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-stretch.png"]];
        rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-annotation-right.png"]];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        titleLabel.shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
        titleLabel.shadowOffset = CGSizeMake(0,-1);
        
        subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        subtitleLabel.textColor = [UIColor whiteColor];
        subtitleLabel.backgroundColor = [UIColor clearColor];
        subtitleLabel.font = [UIFont systemFontOfSize:12.0];
        subtitleLabel.shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
        subtitleLabel.shadowOffset = CGSizeMake(0,-1);
        
        [self addSubview:leftImageView];
        [self addSubview:leftMiddleImageView];
        [self addSubview:middleTopImageView];
        [self addSubview:middleBottomImageView];
        [self addSubview:rightMiddleImageView];
        [self addSubview:rightImageView];
        
        [self addSubview:titleLabel];
        [self addSubview:subtitleLabel];
        [self addSubview:self.accessoryButton];
        
        middleTopImageView.hidden = YES;
        
        self.offsetY = ANNOTATION_OFFSET_TOP;
    }
    
    return self;
}

- (void)setMarker:(RMMarker *)marker title:(NSString *)title subtitle:(NSString *)subtitle {
    
    _marker = marker;
    titleLabel.text = title;
    subtitleLabel.text = subtitle;
    
    [self configureSubviews];
    
    [self moveToPoint:marker.position];
}


- (void)moveToPoint:(CGPoint)point {
    float x = ((point.x - (_contentWidth / 2.0)));
    float y = (point.y - ANNOTATION_HEIGHT_FULL - self.offsetY);
    
    self.frame = CGRectMake(x, y, _contentWidth, ANNOTATION_HEIGHT_FULL);
}

- (void)configureSubviews { 
    CGSize titleSize = [titleLabel.text sizeWithFont:titleLabel.font];
    CGSize subtitleSize = [subtitleLabel.text sizeWithFont:subtitleLabel.font];

    float contentWidth = MIN(MAX(titleSize.width, subtitleSize.width) + ANNOTATION_PADDING, ANNOTATION_WIDTH_MAX);

    float minWidth = ANNOTATION_WIDTH_MIN;
    float diff = contentWidth - minWidth;
    float leftPart = floorf(diff / 2.0);
    float rightPart = diff - leftPart;
    
    leftImageView.frame = CGRectMake(0, 0, 17.0, ANNOTATION_HEIGHT);
    leftMiddleImageView.frame = CGRectMake(leftImageView.frame.size.width, 0, leftPart, ANNOTATION_HEIGHT);
    middleTopImageView.frame = CGRectMake(leftMiddleImageView.frame.origin.x + leftMiddleImageView.frame.size.width, 0, ANNOTATION_IMAGE_WIDTH, ANNOTATION_HEIGHT_FULL);
    middleBottomImageView.frame = CGRectMake(leftMiddleImageView.frame.origin.x + leftMiddleImageView.frame.size.width, 0, ANNOTATION_IMAGE_WIDTH, ANNOTATION_HEIGHT_FULL);
    rightMiddleImageView.frame = CGRectMake(middleTopImageView.frame.origin.x + middleTopImageView.frame.size.width, 0, rightPart, ANNOTATION_HEIGHT);
    rightImageView.frame = CGRectMake(rightMiddleImageView.frame.origin.x + rightMiddleImageView.frame.size.width, 0, 17.0, ANNOTATION_HEIGHT);
    self.accessoryButton.frame = CGRectMake(contentWidth - 44.0, 8.0, ANNOTATION_BUTTON_SIZE, ANNOTATION_BUTTON_SIZE);
    
    titleLabel.frame = CGRectMake(18.0, 2.0, contentWidth - ANNOTATION_PADDING, 24.0);
    subtitleLabel.frame = CGRectMake(18.0, 24.0, contentWidth - ANNOTATION_PADDING, 18.0);
    
    _contentWidth = contentWidth;
}

- (void)layoutSubviews {
    [self configureSubviews];
}

- (void)dealloc {
    [titleLabel release];
    [subtitleLabel release];
    [leftImageView release];
    [leftMiddleImageView release];
    [middleTopImageView release];
    [middleBottomImageView release];
    [rightMiddleImageView release];
    [rightImageView release];
    [disclosureImage release];
    self.accessoryButton = nil;
    [super dealloc];
}

@end
