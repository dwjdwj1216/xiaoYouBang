//
//  UIColor+TLChat.m
//  TLChat
//
//  Created by 李伯坤 on 16/1/27.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "UIColor+TLChat.h"

@implementation UIColor (TLChat)


#pragma mark - Global
+ (UIColor *)colorTableViewBG
{
    return TLColor(239.0, 239.0, 244.0, 1.0);
}

+ (UIColor *)colorDefaultGreen
{
    return TLColor(61.0, 190.0, 94.0, 1.0f);
}

+ (UIColor *)colorDefaultBlack
{
    return TLColor(248, 248, 248, 1.0);
}

+ (UIColor *)colorTabBarBG
{
    return TLColor(239.0, 239.0, 244.0, 1.0);
}

+ (UIColor *)colorNavBarTint
{
    return [UIColor whiteColor];
}

+ (UIColor *)colorNavBarBarTint
{
    return TLColor(20.0, 20.0, 20.0, 0.9);
}

+ (UIColor *)colorSearchBarTint
{
    return TLColor(239.0, 239.0, 244.0, 1.0);
}

+ (UIColor *)colorSearchBarBorder
{
    return [UIColor colorSearchBarTint];
    //    return TLColor(220, 220, 220, 1.0);
}

+ (UIColor *)colorCellLine
{
    return [UIColor colorWithWhite:0.5 alpha:0.3];
}

+ (UIColor *)colorCellMoreButton
{
    return [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0];
}

#pragma mark - Conversation
+ (UIColor *)colorConversationDetail
{
    return [UIColor grayColor];
}

+ (UIColor *)colorConversationTime
{
    return TLColor(160, 160, 160, 1.0);
}

+ (UIColor *)colorNavAddMenuBG
{
    return TLColor(71, 70, 73, 1.0);
}

+ (UIColor *)colorNavAddMenuBGHL
{
    return TLColor(65, 64, 67, 1.0);
}

#pragma mark - Discover
+ (UIColor *)colorBlackBG
{
    return TLColor(42, 45, 46, 1.0);
}

+ (UIColor *)colorScannerBG
{
    return [UIColor colorWithWhite:0 alpha:0.6];
}

#pragma mark - Chat
+ (UIColor *)colorChatBar
{
    return TLColor(245, 245, 247, 1.0);
}

+ (UIColor *)colorChatTableViewBG
{
    return TLColor(235.0, 235.0, 235.0, 1.0);
}

+ (UIColor *)colorChatBox
{
    return TLColor(244.0, 244.0, 246.0, 1.0);
}

+ (UIColor *)colorChatBoxLine
{
    return TLColor(188.0, 188.0, 188.0, 0.7f);
}

+ (UIColor *)colorChatEmojiSend
{
    return TLColor(25.5, 102.0, 204.0, 1.0);
}

#pragma mark - WebView
+ (UIColor *)colorWebViewAuthText
{
    return TLColor(107, 111, 113, 1.0);
}

@end
