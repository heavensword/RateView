//
//  RankView.m
//  TaoBan
//
//  Created by Sword on 11-11-2.
//  Copyright (c) 2011年 itotemstudio. All rights reserved.
//

#import "RankView.h"

@interface RankView()
{
    CGFloat                 _x;
    CGFloat                 _rate;
    CGSize                  _iconSize;
    
    NSMutableDictionary     *_starImageViewsDic;
    NSMutableDictionary     *_backgroundImageViewsDic;
    
    UIView                  *_starContentView;
}
@end

@implementation RankView

#pragma mark - private methods
- (void)initComponents
{
    _spacing = 0;
    _x = 0;
    _number = 5;    
    _scrollToRate = TRUE;
    _iconSize = CGSizeZero;
    // Initialization code
    _starImageViewsDic = [[NSMutableDictionary alloc] init];
    _backgroundImageViewsDic = [[NSMutableDictionary alloc] init];
    _starContentView = [[UIView alloc] initWithFrame:CGRectZero];
    _starContentView.backgroundColor = [UIColor clearColor];
    _starContentView.clipsToBounds = TRUE;
    self.clipsToBounds = TRUE;
    [self addSubview:_starContentView];
    
    //add pan gesture to detect moveing action to change rank
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureRecognizer:)];
    [self addGestureRecognizer:panGestureRecognizer];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureRecognizer:)];
    [self addGestureRecognizer:tapGestureRecognizer];
}

- (void)handleTapGestureRecognizer:(UIPanGestureRecognizer*)recognizer
{
    CGPoint location = [recognizer locationInView:self];
    [self changeRankWithLocation:location];
}

- (void)handlePanGestureRecognizer:(UIPanGestureRecognizer*)recognizer
{
    CGPoint location = [recognizer locationInView:self];
    [self changeRankWithLocation:location];
}

- (void)changeRankWithLocation:(CGPoint)location
{
    NSInteger rate = ((location.x - [self marginX] + _spacing) / (self.iconSize.width + _spacing));
    if (_scrollToRate) {
        _x = location.x;
        CGFloat tmpRate = rate;
        if (location.x >= [self marginX] + rate * (self.iconSize.width + _spacing)) {
            tmpRate = rate + (location.x - rate * (self.iconSize.width + _spacing)- [self marginX]) / self.iconSize.width;
        }
        else {
            tmpRate = rate;
        }
        if (tmpRate >= 0 && tmpRate <= _number) {
            _rate = tmpRate;
        }
    }
    else {
        rate = ceil(((location.x - [self marginX]) / self.iconSize.width));
        if (rate >= 0 && rate <= _number) {
            _rate = rate;
            _x = rate * self.iconSize.width + [self marginX];
        }
    }
    [self setNeedsLayout];
}

- (CGFloat)marginX
{
    return  (CGRectGetWidth(self.bounds) - self.iconSize.width * _number - (_number - 1) * self.spacing) / 2;;
}

- (CGRect)getImageViewFrameWithIndex:(CGFloat) index
{

    CGFloat marginX = [self marginX];
    CGFloat y = (CGRectGetHeight(self.bounds) - self.iconSize.height)/2;
    if (y < 0) {
        y = 0;
    }
    CGFloat x = index * self.iconSize.width;
    x += marginX;
    x += index * self.spacing;
    CGFloat width = self.iconSize.width;
    CGRect rect = CGRectMake(x, y, width, self.iconSize.height);
    return rect;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        [self initComponents];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initComponents];
}

- (void)layoutSubviews
{
    NSInteger n = (NSInteger)_number;
    NSString *bgKey = nil;
    NSString *key = nil;
    UIImageView *imageView;
    CGFloat marginY = (CGRectGetHeight(self.bounds) - self.iconSize.height) / 2;
    if (marginY < 0) {
        marginY = 0;
    }    
    for (NSInteger i = 0; i < n; i++) {
        bgKey = [[NSString alloc] initWithFormat:@"KEY_BGIMAGEVIEW_%d", i];
        imageView = _backgroundImageViewsDic[bgKey];
        if (!imageView) {
            imageView = [[UIImageView alloc] init];
            _backgroundImageViewsDic[bgKey] = imageView;
            [self addSubview:imageView];             
        }
        imageView.image = [UIImage imageNamed:self.backgroundImageName];
        imageView.frame = [self getImageViewFrameWithIndex:i];
        [self sendSubviewToBack:imageView];
    }
    n = ceil(_rate);
    for (NSInteger i = 0; i < n; i++) 
    {
        key  = [[NSString alloc] initWithFormat:@"KEY_IMAGEVIEW_%d", i];         
        imageView = _starImageViewsDic[key];
        if (!imageView) 
        {       
            imageView = [[UIImageView alloc] init];
            _starImageViewsDic[key] = imageView;
            [_starContentView addSubview:imageView];             
        }
        imageView.image = [UIImage imageNamed:self.foreheadImageName];
        imageView.frame = [self getImageViewFrameWithIndex:i];        
        [_starContentView bringSubviewToFront:imageView];        
    }
    CGFloat rating = _rate - n;
    if (rating > 0.0)
    {   
        key  = [[NSString alloc] initWithFormat:@"KEY_IMAGEVIEW_%d", n];         
        imageView = _starImageViewsDic[key];
        if (!imageView) 
        {       
            imageView = [[UIImageView alloc] init];
            _starImageViewsDic[key] = imageView;
        }
        [_starContentView addSubview:imageView];
        imageView.image = [UIImage imageNamed:self.foreheadImageName];        
        imageView.frame = [self getImageViewFrameWithIndex:n];
        [_starContentView bringSubviewToFront:imageView];
    }
    _starContentView.frame = CGRectMake(0, 0, _x, CGRectGetHeight(self.bounds));
    [self bringSubviewToFront:_starContentView];    
}

- (void)setRate:(CGFloat)number
{
    _rate = number;
    [self setNeedsLayout];
}

- (CGSize)iconSize
{
    NSAssert(!CGSizeEqualToSize(CGSizeZero, _iconSize), @"you have to define iconSize property!");
    return _iconSize;
}

- (void)dealloc
{
    _starImageViewsDic = nil;
    _backgroundImageViewsDic = nil;
    _foreheadImageName = nil;
    _backgroundImageName = nil;
}

@end
