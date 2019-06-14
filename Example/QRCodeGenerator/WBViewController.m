//
//  WBViewController.m
//  QRCodeGenerator
//
//  Created by PeterJames4719 on 06/14/2019.
//  Copyright (c) 2019 PeterJames4719. All rights reserved.
//

#import "WBViewController.h"
#import <QRCodeGenerator.h>

@interface WBViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imgView1;
@property (nonatomic, weak) IBOutlet UIImageView *imgView2;
@property (nonatomic, weak) IBOutlet UIImageView *imgView3;
@end

@implementation WBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *string = @"https://www.baidu.com";
    UIImage *img1 = [QRCodeGenerator qrImageForString:string imageSize:150];
    _imgView1.image = img1;
    
    UIImage *img2 = [QRCodeGenerator qrImageForString:string imageSize:150 fillColor:[UIColor blackColor] borderColor:nil borderWidth:0 margin:0];
    _imgView2.image = img2;
    
    UIImage *img3 = [QRCodeGenerator qrImageForString:string imageSize:150 fillColor:[UIColor redColor] borderColor:[UIColor redColor] borderWidth:1 margin:20];
    _imgView3.image = img3;
    
    NSLog(@"size:%@", NSStringFromCGSize(img1.size));
    NSLog(@"scale:%f", img1.scale);
    
    
    _imgView1.layer.borderColor = [UIColor blackColor].CGColor;
    _imgView1.layer.borderWidth = 1;
    
    _imgView2.layer.borderColor = [UIColor blackColor].CGColor;
    //_imgView2.layer.borderWidth = 1;
    
    _imgView3.layer.borderColor = [UIColor blackColor].CGColor;
    //_imgView3.layer.borderWidth = 1;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
