//
//  CompanyMarkViewController.h
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonCell.h"
#import "ContentCell.h"
@interface CompanyMarkViewController : UITableViewController

@property (nonatomic, strong) NSString *companyName;

@property (nonatomic, strong) NSString *score;

@property (nonatomic, strong) NSMutableArray *data;

@end
