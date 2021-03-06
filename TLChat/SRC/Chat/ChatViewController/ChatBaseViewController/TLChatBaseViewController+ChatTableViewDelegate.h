//
//  TLChatBaseViewController+ChatTableViewDelegate.h
//  TLChat
//
//  Created by 李伯坤 on 16/3/17.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLChatBaseViewController.h"

#define     MAX_SHOWTIME_MSG_COUNT      10
#define     MAX_SHOWTIME_MSG_SECOND     30

@interface TLChatBaseViewController (ChatTableViewDelegate) <TLChatTableViewControllerDelegate>

/**
 *  展示消息（添加到chatVC）
 */
- (void)addToShowMessage:(TLMessage *)message;

- (void)resetChatTVC;

@end
