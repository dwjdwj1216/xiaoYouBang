//
//  CircleSearchViewcontroller.h
//  TLChat
//
//  Created by 戴王炯 on 5/2/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLTableViewController.h"

@interface CircleSearchViewcontroller : TLTableViewController <UISearchResultsUpdating>
@property (nonatomic, strong) NSMutableArray *circleData;
@end
