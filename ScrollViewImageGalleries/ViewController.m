//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Tyson Parks on 2/26/18.
//  Copyright © 2018 Tyson Parks. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) NSMutableArray <UIImageView *> *imageViewsArray;

-(void)setupViews;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageViewsArray = [[NSMutableArray alloc]init];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setDelegate:self];
    
    [self setupViews];
    
    
    
}

-(void)setupViews {
    UIImage *lHInField = [UIImage imageNamed:@"Lighthouse-in-Field"];
    UIImage *lHNight = [UIImage imageNamed:@"Lighthouse-night"];
    UIImage *lHZoomed = [UIImage imageNamed:@"Lighthouse-zoomed"];
    
    UIImageView *lHInFieldView = [[UIImageView alloc]initWithImage:lHInField];
    UIImageView *lHNightView = [[UIImageView alloc]initWithImage:lHNight];
    UIImageView *lHZoomedView = [[UIImageView alloc]initWithImage:lHZoomed];
    
    lHInFieldView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    lHNightView.frame = CGRectMake(self.view.frame.size.width, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    lHZoomedView.frame = CGRectMake(self.view.frame.size.width * 2, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.scrollView addSubview:lHInFieldView];
    [self.scrollView addSubview:lHNightView];
    [self.scrollView addSubview:lHZoomedView];
    
    [self.imageViewsArray addObject:lHInFieldView];
    [self.imageViewsArray addObject:lHNightView];
    [self.imageViewsArray addObject:lHZoomedView];
    
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width * self.imageViewsArray.count, 0.0)];
     
    
    
    //    for (int i = 0; i<3; i++) {
    //
    //        UIImageView *LHImageView = [UIImageView alloc]init
    //        switch (i) {
    //            case 0:
    //                [self.imageViewsArray addObject:LHInFieldView];
    //                break;
    //
    //            case 1:
    //                [self.imageViewsArray addObject:LHNightView];
    //                break;
    //
    //            case 2:
    //                [self.imageViewsArray addObject:LHZoomedView];
    //                break;
    //          }
    //        }
    
}

@end
