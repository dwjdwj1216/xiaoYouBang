//
//  TLRootViewController.m
//  TLChat
//
//  Created by 李伯坤 on 16/1/23.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLRootViewController.h"
#import "TLJobViewController.h"
#import "TLConversationViewController.h"
#import "TLFriendsViewController.h"
#import "TLDiscoverViewController.h"
#import "TLMineViewController.h"

static TLRootViewController *rootVC = nil;

@interface TLRootViewController ()

@property (nonatomic, strong) NSArray *childVCArray;

@property (nonatomic, strong) TLConversationViewController *conversationVC;
@property (nonatomic, strong) TLFriendsViewController *friendsVC;
@property (nonatomic, strong) TLJobViewController *jobVC;
@property (nonatomic, strong) TLDiscoverViewController *discoverVC;
@property (nonatomic, strong) TLMineViewController *mineVC;

@end

@implementation TLRootViewController

+ (TLRootViewController *) sharedRootViewController
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        rootVC = [[TLRootViewController alloc] init];
    });
    return rootVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setViewControllers:self.childVCArray];       // 初始化子控制器
}

- (id)childViewControllerAtIndex:(NSUInteger)index
{
    return [[self.childViewControllers objectAtIndex:index] rootViewController];
}

#pragma mark - Getters
- (NSArray *) childVCArray
{
    if (_childVCArray == nil) {
        TLNavigationController *convNavC = [[TLNavigationController alloc] initWithRootViewController:self.conversationVC];
        //TLNavigationController *friendNavC = [[TLNavigationController alloc] initWithRootViewController:self.friendsVC];
        TLNavigationController *jobNavC = [[TLNavigationController alloc]initWithRootViewController:self.jobVC];
        TLNavigationController *discoverNavC = [[TLNavigationController alloc] initWithRootViewController:self.discoverVC];
        TLNavigationController *mineNavC = [[TLNavigationController alloc] initWithRootViewController:self.mineVC];
        _childVCArray = @[convNavC,jobNavC, discoverNavC, mineNavC];
    }
    return _childVCArray;
}

- (TLConversationViewController *) conversationVC
{
    if (_conversationVC == nil) {
        _conversationVC = [[TLConversationViewController alloc] init];
        [_conversationVC.tabBarItem setTitle:@"消息"];
        [_conversationVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
        [_conversationVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _conversationVC;
}


- (TLJobViewController *) jobVC
{
    if (_jobVC == nil) {
        _jobVC = [[TLJobViewController alloc] init];
        [_jobVC.tabBarItem setTitle:@"职场"];
        [_jobVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_career"]];
        [_jobVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_careerHL"]];
    }
    return _jobVC;
}

/*
-(SegementViewController *)segementVC{
    if (_segementVC == nil) {
        _segementVC = [[SegementViewController alloc]init];
        [_segementVC.tabBarItem setTitle:@"职场"];
        [_segementVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_career"]];
        [_segementVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_careerHL"]];
    }
    return _segementVC;
}
*/
- (TLDiscoverViewController *) discoverVC
{
    if (_discoverVC == nil) {
        _discoverVC = [[TLDiscoverViewController alloc] init];
        [_discoverVC.tabBarItem setTitle:@"圈子"];
        [_discoverVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discover"]];
        [_discoverVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    }
    return _discoverVC;
}

- (TLMineViewController *) mineVC
{
    if (_mineVC == nil) {
        _mineVC = [[TLMineViewController alloc] init];
        [_mineVC.tabBarItem setTitle:@"我"];
        [_mineVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_me"]];
        [_mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    }
    return _mineVC;
}

@end
