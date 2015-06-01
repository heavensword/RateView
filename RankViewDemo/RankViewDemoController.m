//
//  ViewController.m
//  RankViewDemo
//
//  Created by Sword on 10/16/14.
//  Copyright (c) 2014 Sword. All rights reserved.
//

#import "RankViewDemoController.h"
#import "ZHJRankView.h"

@interface RankViewDemoController ()

@property (weak, nonatomic) IBOutlet ZHJRankView *firstRankView;
@property (weak, nonatomic) IBOutlet ZHJRankView *secondRankView;
@property (weak, nonatomic) IBOutlet ZHJRankView *thirdRankView;

@end

@implementation RankViewDemoController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.firstRankView.foreheadImageName = @"goldLeafItalics";
    self.firstRankView.backgroundImageName = @"sliverLeafItalics";
    self.firstRankView.iconSize = CGSizeMake(46, 23.5);
    self.firstRankView.scrollToRate = TRUE;
    self.firstRankView.rate = 2.5;
    
    self.secondRankView.foreheadImageName = @"like_ac";
    self.secondRankView.backgroundImageName = @"like";
    self.secondRankView.iconSize = CGSizeMake(25, 25);
    self.secondRankView.scrollToRate = TRUE;
    self.secondRankView.spacing = 5;
    self.secondRankView.rate = 2.0;
    
    self.thirdRankView.foreheadImageName = @"btn_star";
    self.thirdRankView.backgroundImageName = @"bg_star";
    self.thirdRankView.iconSize = CGSizeMake(17, 16);
    self.thirdRankView.scrollToRate = FALSE;
    self.thirdRankView.spacing = 5;
    self.thirdRankView.rate = 4.5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
