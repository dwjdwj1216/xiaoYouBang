//
//  JobCircleViewController.h
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "CircleHelper.h"
#import "CircleItem.h"
@interface JobCircleViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) CircleHelper *circleHelper;

@end
