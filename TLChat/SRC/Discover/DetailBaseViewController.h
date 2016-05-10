//
//  DetailBaseViewController.h
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface DetailBaseViewController : UIViewController <UITextViewDelegate>

/// 消息展示页面
@property (nonatomic, strong) DetailViewController *detailTVC;

@end
