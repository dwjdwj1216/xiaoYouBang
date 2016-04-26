//
//  BannerView.m
//  TLChat
//
//  Created by 戴王炯 on 4/22/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "BannerView.h"
#import "SDCycleScrollView.h"
@implementation BannerView

+(BannerView *)initWith:(UIView*)view origin:(CGPoint)origin size:(CGSize)size{
    UIScrollView *demoContainerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,44, size.width,size.height)];
    demoContainerView.contentSize = CGSizeMake(size.width, size.height);
    [view addSubview:demoContainerView];
    NSArray *imageNames = @[@"banner_img0.jpg",@"banner_img1.jpg",@"banner_img2.jpg",@"banner_img3.jpg",@"banner_img4.jpg"];
    //NSLog(@"view:%f %f %f %f ",view.frame.origin.x,view.frame.origin.y,view.frame.size.width,view.frame.size.height);
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(origin.x,0, size.width, size.height) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [demoContainerView addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //[demoContainerView setBackgroundColor:[UIColor redColor]];
    return demoContainerView;
}

@end
