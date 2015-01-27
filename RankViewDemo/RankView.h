//
//  RankView.h
//  TaoBan
//
//  Created by Sword on 11-11-2.
//  Copyright (c) 2011年 Sword. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankView : UIView
{
}

/*!
 * enable to scroll to rate, default is TRUE
 */
@property (nonatomic, assign) BOOL scrollToRate;
/*!
 * Default value 0. the value of rate range in 0-number
 */
@property (nonatomic, assign) CGFloat rate;

@property (nonatomic, assign) CGFloat spacing;

/*!
 * The maximum rate
 */
@property (nonatomic, assign) CGFloat number;
/*!
 * The caller have to define iconsize, otherwise cause an exception.
 */
@property (nonatomic, assign) CGSize  iconSize;

@property (nonatomic, strong) NSString *foreheadImageName;
@property (nonatomic, strong) NSString *backgroundImageName;

@end
