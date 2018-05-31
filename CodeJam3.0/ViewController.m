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

- (void) downloadImages;
//- (void) downloadGroupImages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height / 4;

    // 1
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
//    [v1 setBackgroundColor:UIColor.redColor];
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




    self.ulrS = [NSArray arrayWithObjects:@"https://pp.userapi.com/c844724/v844724516/6b674/fNIzsBm73r4.jpg",
                          @"https://pp.userapi.com/c635102/v635102883/297ed/MBDak0YH2U8.jpg",
                          @"https://sun9-5.userapi.com/c840730/v840730536/88a76/GA2ug4oPOPs.jpg", nil];
    
    self.imgS = [NSArray arrayWithObjects:img1,img2,img3, nil];

    
    //group
//    NSArray *arrOfURL2 = [NSArray arrayWithObjects:@"https://pp.userapi.com/c824411/v824411454/157843/5g3jhGSjGNo.jpg"
//                          @"https://pp.userapi.com/c845324/v845324309/69b47/4tvKc5FXwlk.jpg"
//                          @"https://pp.userapi.com/c834302/v834302366/1567c3/Er12YQ2FW4c.jpg", nil];
//    NSArray *arrOfImages2 = [NSArray arrayWithObjects:img41,img42,img43, nil];
//
//
//    NSMutableArray<NSData*> *dataArrForImages = [[NSMutableArray alloc] init];
//
//    dispatch_group_t group = dispatch_group_create();
//
//    dispatch_group_async(group, dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
//        for(int i = 0; i < arrOfURL2.count; i++) {
//            dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
//                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[arrOfURL2 objectAtIndex:i]]];
//                [dataArrForImages addObject:data];
//            });
//        }
//    });
//
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        for(int i = 0; i < dataArrForImages.count; i++) {
//
//            if([dataArrForImages objectAtIndex:i]) {
//        [[arrOfImages2 objectAtIndex:i] setImage: [UIImage imageWithData:[dataArrForImages objectAtIndex:i]]];
//            }
//        }
//    });
    
    [img1 release];
    [img2 release];
    [img3 release];
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
    for(int i = 0; i < self.ulrS.count; i++) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[self.ulrS objectAtIndex:i]]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self.imgS objectAtIndex:i] setImage: [UIImage imageWithData:data]];
            });
        });
    }
}

- (void) dealloc {
    [_view1 release];
    [_view2 release];
    [_view3 release];
    [_view4 release];
    [_refreshBttn release];
    [_ulrS release];
    [_imgS release];
    [super dealloc];
}

@end
