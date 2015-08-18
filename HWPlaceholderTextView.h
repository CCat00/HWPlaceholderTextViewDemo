//
//  HWPlaceholderTextView.h
//
//
//  Created by HanWei on 15/8/18.
//  Copyright (c) 2015年 AndLiSoft. All rights reserved.
//
//  带占位符的 UITextView  iOS 7.0
//

#import <UIKit/UIKit.h>

NS_CLASS_AVAILABLE_IOS(7_0) @interface HWPlaceholderTextView : UITextView

/*
 * 占位字符串
 */
@property(nonatomic,copy) NSString *placeholder;

@end
