//
//  ViewController.m
//  LLGifView
//
//  Created by zhaomengWang on 17/1/19.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "ViewController.h"
#import "LLGifView.h"

@interface ViewController ()

@property (nonatomic, strong) LLGifView *gifView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//方式一：显示本地Gif图片(将图片转为NSData数据)
- (IBAction)btn1:(UIButton *)sender {
    [self removeGif];
    NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"example" ofType:@"gif"]];
    _gifView = [[LLGifView alloc] initWithFrame:CGRectMake(100, 100, 200, 80) data:localData];
    [self.view addSubview:_gifView];
    [_gifView startGif];
}

//方式二：显示本地Gif图片(得到图片的路径)
- (IBAction)btn2:(UIButton *)sender {
    [self removeGif];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"gif"];
    _gifView = [[LLGifView alloc] initWithFrame:CGRectMake(100, 200, 200, 80) filePath:filePath];
    [self.view addSubview:_gifView];
    [_gifView startGif];
}

 //方式三：显示从网络获取的Gif图片
- (IBAction)btn3:(UIButton *)sender {
    [self removeGif];
    //此处使用异步加载
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://pic19.nipic.com/20120222/8072717_124734762000_2.gif"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (urlData) {
                _gifView = [[LLGifView alloc] initWithFrame:CGRectMake(100, 300, 200, 80) data:urlData];
                [self.view addSubview:_gifView];
                [_gifView startGif];
            }
            else {
                NSLog(@"请允许应用访问网络");
            }
        });
    });
}

- (void)removeGif {
    if (_gifView) {
        [_gifView removeFromSuperview];
        _gifView = nil;
    }
}

@end
