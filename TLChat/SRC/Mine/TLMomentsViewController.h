//
//  TLMomentsViewController.h
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLTableViewController.h"
#import "TLMomentsProxy.h"
@interface TLMomentsViewController : TLTableViewController

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) TLMomentsProxy *proxy;
@end
