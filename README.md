RankView
========

a custom rank view, it supprots custom forehead image and background image

<img width="320px;" height="568px;" src="https://raw.githubusercontent.com/heavensword/RankView/master/ScreenShots/screenshots1.png"></img>

# Usage

You can add RankView to super view using xib or code. Details in Demo.


```objective-c
#import "RankView.h"

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
self.thirdRankView.userInteractionEnabled = FALSE;

```