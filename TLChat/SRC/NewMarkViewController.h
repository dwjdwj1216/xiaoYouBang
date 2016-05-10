//
//  NewMarkViewController.h
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarRatingView.h"

@interface NewMarkViewController : UIViewController <UITextViewDelegate,StarRatingViewDelegate>

@property (nonatomic, strong) NSString *companyName;



@end
