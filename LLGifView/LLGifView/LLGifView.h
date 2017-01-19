//
//  LLGifView.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/11/15.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LLGifView : UIView 

- (id)initWithFrame:(CGRect)frame filePath:(NSString *)filePath;
- (id)initWithFrame:(CGRect)frame data:(NSData *)data;
- (void)startGif;
- (void)stopGif;

@end
