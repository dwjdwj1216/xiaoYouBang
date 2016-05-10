//
//  DetailViewController.h
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleItem.h"
@interface DetailViewController : UITableViewController

@property (nonatomic, strong) CircleItem *item;

@property (nonatomic, strong) NSMutableArray *data;

@end
