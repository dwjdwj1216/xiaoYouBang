//
//  TLDiscoverViewController.h
//  TLChat
//
//  Created by 李伯坤 on 16/1/23.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLMenuViewController.h"
#import "TLFriendSearchViewController.h"
@interface TLDiscoverViewController : TLMenuViewController < UISearchBarDelegate>
@property (nonatomic, strong) TLFriendSearchViewController *searchVC;
@end
