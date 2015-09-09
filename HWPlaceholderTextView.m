//
//  HWPlaceholderTextView.h
//
//
//  Created by HanWei on 15/8/18.
//  Copyright (c) 2015年 AndLiSoft. All rights reserved.
//
//  带占位符的 UITextView  iOS 7.0
//

#import "HWPlaceholderTextView.h"

@interface HWPlaceholderTextView ()

@property (nonatomic, strong) UILabel *placeHolderLabel;

@end

@implementation HWPlaceholderTextView

@synthesize placeHolderLabel;
@synthesize placeholder = _placeholder;

#pragma mark - Init
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshPlaceholder) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshPlaceholder) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.placeHolderLabel.width = frame.size.width-10;
}

#pragma mark - Private
- (void)refreshPlaceholder
{
    if([[self text] length])
    {
        [self.placeHolderLabel setAlpha:0];
    }
    else
    {
        [self.placeHolderLabel setAlpha:1];
    }
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self refreshPlaceholder];
}

- (void)insertText:(NSString *)text
{
    [super insertText:text];
    [self refreshPlaceholder];
}

- (void)deleteBackward
{
    [super deleteBackward];
    [self refreshPlaceholder];
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeHolderLabel.font = self.font;
}

#pragma mark - setter
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    self.placeHolderLabel.text = self.placeholder;
    [self.placeHolderLabel sizeToFit];
    [self refreshPlaceholder];
}

#pragma mark - getter
- (UILabel *)placeHolderLabel
{
    if (placeHolderLabel == nil)
    {
        placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 7, 0, 0)];
        placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        placeHolderLabel.numberOfLines = 0;
        placeHolderLabel.font = self.font;
        placeHolderLabel.backgroundColor = [UIColor clearColor];
        placeHolderLabel.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        placeHolderLabel.alpha = 0;
        [self addSubview:placeHolderLabel];
    }
    return placeHolderLabel;
}

@end

