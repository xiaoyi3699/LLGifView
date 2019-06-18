//
//  ViewController.m
//  LLGifView
//
//  Created by zhaomengWang on 17/1/19.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "ViewController.h"
#import "LLGifImageView.h"

@interface ViewController ()

@property (nonatomic, strong) LLGifImageView *gifImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//方式一：显示本地Gif图片
- (IBAction)btn1:(UIButton *)sender {
    [self removeGif];
    
    NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"example" ofType:@"gif"]];
    _gifImageView = [[LLGifImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 80)];
    _gifImageView.gifData = localData;
    [self.view addSubview:_gifImageView];
    [_gifImageView startGif];
}

//方式二：显示从网络获取的Gif图片
- (IBAction)btn2:(UIButton *)sender {
    [self removeGif];
    
    //此处使用异步加载
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://pic19.nipic.com/20120222/8072717_124734762000_2.gif"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (urlData) {
                _gifImageView = [[LLGifImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 80)];
                _gifImageView.gifData = urlData;
                [self.view addSubview:_gifImageView];
                [_gifImageView startGif];
            }
            else {
                NSLog(@"请允许应用访问网络");
            }
        });
    });
}

- (void)removeGif {
    if (_gifImageView.superview) {
        [_gifImageView removeFromSuperview];
        _gifImageView = nil;
    }
}

@end
