//
//  LLGifView.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/11/15.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

/*
 //方式一：显示本地Gif图片
 //将图片转为NSData数据
 NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bird" ofType:@"gif"]];
 //创建一个第三方的View显示图片
 LLGifView *dataView = [[LLGifView alloc] initWithFrame:CGRectMake(0, 300, 200, 100) data:localData];
 [self.view addSubview:dataView];
 //方式二：显示本地Gif图片
 //得到图片的路径
 NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"gif"];
 //创建一个第三方的View显示图片
 LLGifView *dataView2 = [[LLGifView alloc] initWithFrame:CGRectMake(200, 300, 150, 100) filePath:path];
 [self.view addSubview:dataView2];
 //方式三：显示从网络获取的Gif图片
 // 网络图片
 NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://pic19.nipic.com/20120222/8072717_124734762000_2.gif"]];
 //创建一个第三方的View显示图片
 LLGifView *dataViewWeb = [[LLGifView alloc] initWithFrame:CGRectMake(20, 420, 280, 100) data:urlData];
 [self.view addSubview:dataViewWeb];
 */

#import <UIKit/UIKit.h>
@interface LLGifView : UIView 

- (id)initWithFrame:(CGRect)frame filePath:(NSString *)filePath;
- (id)initWithFrame:(CGRect)frame data:(NSData *)data;
- (void)startGif;
- (void)stopGif;

@end
