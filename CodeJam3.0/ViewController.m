//
//  ViewController.m
//  CodeJam3.0
//
//  Created by User on 5/31/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(retain, nonatomic) UIView* view1;
@property(retain, nonatomic) UIView* view2;
@property(retain, nonatomic) UIView* view3;
@property(retain, nonatomic) UIView* view4;
@property(retain, nonatomic) UIButton* refreshBttn;
@property(retain, nonatomic) NSArray* ulrS;
@property(retain, nonatomic) NSArray* imgS;
@property(retain, nonatomic) NSMutableArray *downloadedImages;

- (void) downloadImages;
- (void) downloadGroupImages:(NSMutableArray *)imageViewsArr;
- (void) updateUI;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ulrS = [NSArray arrayWithObjects:@"https://pp.userapi.com/c844724/v844724516/6b674/fNIzsBm73r4.jpg",
                 @"https://pp.userapi.com/c635102/v635102883/297ed/MBDak0YH2U8.jpg",
                 @"https://sun9-5.userapi.com/c840730/v840730536/88a76/GA2ug4oPOPs.jpg", nil];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height / 4;

    // 1
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [self.view addSubview:v1];
    [self setView1:v1];
    
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(v1.bounds.size.width / 7,
                                                                      v1.bounds.size.width / 7,
                                                                      v1.bounds.size.width / 5,
                                                                      v1.bounds.size.width / 5)];
    [img1.layer setBorderColor:UIColor.purpleColor.CGColor];
    [img1.layer setBorderWidth:5];
    [v1 addSubview:img1];

    UILabel *label1  = [[UILabel alloc] initWithFrame:CGRectMake(v1.bounds.size.width / 2,
                                                                 v1.bounds.size.width / 5,
                                                                 v1.bounds.size.width / 3,
                                                                 v1.bounds.size.width / 5)];
    [label1 setBackgroundColor:UIColor.whiteColor];
    [label1 setNumberOfLines:0];
    [v1 addSubview:label1];

    //2
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(0, v1.bounds.size.height, width, height)];
//    [v2 setBackgroundColor:UIColor.greenColor];
    [self.view addSubview:v2];
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(v2.bounds.size.width / 7,
                                                                      v2.bounds.size.width / 7,
                                                                      v2.bounds.size.width / 5,
                                                                      v2.bounds.size.width / 5)];
    [self setView2:v2];
    
    [img2.layer setBorderColor:UIColor.purpleColor.CGColor];
    [img2.layer setBorderWidth:5];
    [v2 addSubview:img2];

    UILabel *label2  = [[UILabel alloc] initWithFrame:CGRectMake(v2.bounds.size.width / 2,
                                                                 v2.bounds.size.width / 5,
                                                                 v2.bounds.size.width / 3,
                                                                 v2.bounds.size.width / 5)];
    [label2 setBackgroundColor:UIColor.whiteColor];
    [label2 setNumberOfLines:0];
    [v2 addSubview:label2];




    //3
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, v2.bounds.size.height + v1.bounds.size.height, width, height)];
//    [v3 setBackgroundColor:UIColor.yellowColor];
    [self.view addSubview:v3];

    UIImageView *img3 = [[UIImageView alloc] initWithFrame:CGRectMake(v2.bounds.size.width / 7,
                                                                      v2.bounds.size.width / 7,
                                                                      v2.bounds.size.width / 5,
                                                                      v2.bounds.size.width / 5)];

    [img3.layer setBorderColor:UIColor.blackColor.CGColor];
    [img3.layer setBorderWidth:5];
    [v3 addSubview:img3];
    [self setView3:v3];

    UILabel *label3  = [[UILabel alloc] initWithFrame:CGRectMake(v2.bounds.size.width / 2,
                                                                 v2.bounds.size.width / 5,
                                                                 v2.bounds.size.width / 3,
                                                                 v2.bounds.size.width / 5)];

//    [label3 setBackgroundColor:UIColor.greenColor];
    [label3 setNumberOfLines:0];
    [v3 addSubview:label3];


    //4
    UIView *v4 = [[UIView alloc] initWithFrame:CGRectMake(0, v3.bounds.size.height + v2.bounds.size.height + v1.bounds.size.height, width, height)];
    [v4 setBackgroundColor:UIColor.blueColor];
    [self.view addSubview:v4];
    [self setView4:v4];






    UIImageView *img41 = [[UIImageView alloc] initWithFrame:CGRectMake(10,
                                                                       10,
                                                                       100,
                                                                       100)];
    UIImageView *img42 = [[UIImageView alloc] initWithFrame:CGRectMake(120,
                                                                       10,
                                                                       100,
                                                                       100)];
    UIImageView *img43 = [[UIImageView alloc] initWithFrame:CGRectMake(230,
                                                                       10,
                                                                       100,
                                                                       100)];
    [img41.layer setBorderColor:UIColor.whiteColor.CGColor];
    [img41.layer setBorderWidth:5];

    [img42.layer setBorderColor:UIColor.whiteColor.CGColor];
    [img42.layer setBorderWidth:5];

    [img43.layer setBorderColor:UIColor.whiteColor.CGColor];
    [img43.layer setBorderWidth:5];

    [v4 addSubview:img41];
    [v4 addSubview:img42];
    [v4 addSubview:img43];
    
    self.imgS = [NSArray arrayWithObjects:img1,img2,img3, nil];
    
    
    self.refreshBttn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.refreshBttn setFrame:CGRectMake(v4.bounds.size.width / 2,
                                         v4.bounds.size.height - 50,
                                         130, 40)];
    [self.refreshBttn setTitle:@"REFRESH" forState:UIControlStateNormal];
    [self.refreshBttn setTintColor:UIColor.redColor];
    [self.refreshBttn.layer setBorderColor:UIColor.blackColor.CGColor];
    [self.refreshBttn.layer setBorderWidth:1];

    [v4 addSubview:self.refreshBttn];
    
    [self.refreshBttn addTarget:self action:@selector(downloadImages) forControlEvents:UIControlEventTouchUpInside];




    
    
    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:self.ulrS.count];
    [self setDownloadedImages:mutArr];
    
    
    NSMutableArray *groupImages = [NSMutableArray arrayWithObjects:img41,img42,img43, nil];
    [self downloadGroupImages:groupImages];
    
    [img1 release];
    [img2 release];
    [img3 release];
    [img41 release];
    [img42 release];
    [img43 release];
    [label1 release];
    [label2 release];
    [label3 release];
    [img41 release];
    [img42 release];
    [img43 release];
    [v1 release];
    [v2 release];
    [v3 release];
    [v4 release];
}





- (void) downloadImages {
    __weak typeof (self) weakSelf = self;
    for(int i = 0; i < 3; i++) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            NSData *dataImage = [NSData dataWithContentsOfURL:[NSURL URLWithString:[weakSelf.ulrS objectAtIndex:i]]];
            [weakSelf.downloadedImages addObject:dataImage];
            NSLog(@"%i downloaded", i);
        });
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        if(weakSelf.downloadedImages.count <= 3) {
            [weakSelf updateUI];
        }
        
//        NSLog(@"BEFORE %lu", weakSelf.downloadedImages.count);
        [weakSelf.downloadedImages removeAllObjects];
//        NSLog(@"AFTER %lu", weakSelf.downloadedImages.count);
    });
}

- (void)updateUI {
    __weak typeof (self) weakSelf = self;
    for(int i = 0; i < weakSelf.downloadedImages.count; i++) {
        if(i == 3) {
            [[weakSelf.imgS objectAtIndex:i - 1] setImage:[UIImage imageWithData:[weakSelf.downloadedImages objectAtIndex:i]]];
        } else {
            [[weakSelf.imgS objectAtIndex:i] setImage:[UIImage imageWithData:[weakSelf.downloadedImages objectAtIndex:i]]];
        }
    }
}

- (void) downloadGroupImages:(NSMutableArray *)imageViewsArr {
    dispatch_group_t group = dispatch_group_create();
    __weak typeof (self) weakSelf = self;
    for(int i = 0; i < 3; i++) {
        dispatch_group_enter(group);
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            NSData *dataImage = [NSData dataWithContentsOfURL:[NSURL URLWithString:[weakSelf.ulrS objectAtIndex:i]]];
            [weakSelf.downloadedImages addObject:dataImage];
            NSLog(@"%i data downloaded", i);
            dispatch_group_leave(group);
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        for(int i = 0; i < 3; i++) {
            [[imageViewsArr objectAtIndex:i] setImage:[UIImage imageWithData:[weakSelf.downloadedImages objectAtIndex:i]]];
        }
//        [weakSelf.downloadedImages removeAllObjects];
    });
    dispatch_release(group);
    
}

- (void) dealloc {
    [_view1 release];
    [_view2 release];
    [_view3 release];
    [_view4 release];
    [_refreshBttn release];
    [_ulrS release];
    [_imgS release];
    [_downloadedImages release];
    [super dealloc];
}

@end
