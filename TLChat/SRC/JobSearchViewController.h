//
//  JobSearchViewController.h
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLTableViewController.h"


@interface JobSearchViewController : TLTableViewController<UISearchResultsUpdating>

@property (nonatomic, strong) NSMutableArray *listData;

@end
