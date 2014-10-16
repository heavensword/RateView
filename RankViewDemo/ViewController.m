//
//  ViewController.m
//  RankViewDemo
//
//  Created by Sword on 10/16/14.
//  Copyright (c) 2014 Sword. All rights reserved.
//

#import "ViewController.h"
#import "RankView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet RankView *firstRankView;
@property (weak, nonatomic) IBOutlet RankView *secondRankView;
@property (weak, nonatomic) IBOutlet RankView *thirdRankView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.firstRankView.foreheadImageName = @"goldLeafItalics";
    self.firstRankView.backgroundImageName = @"sliverLeafItalics";
    self.firstRankView.iconSize = CGSizeMake(46, 23.5);
    self.firstRankView.scrollToRate = TRUE;
    
    self.secondRankView.foreheadImageName = @"like_ac";
    self.secondRankView.backgroundImageName = @"like";
    self.secondRankView.iconSize = CGSizeMake(25, 25);
    self.secondRankView.scrollToRate = TRUE;
    self.secondRankView.spacing = 5;
    
    self.thirdRankView.foreheadImageName = @"btn_star";
    self.thirdRankView.backgroundImageName = @"bg_star";
    self.thirdRankView.iconSize = CGSizeMake(17, 16);
    self.thirdRankView.scrollToRate = FALSE;
    self.thirdRankView.spacing = 5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
