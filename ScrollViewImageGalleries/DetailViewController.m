//
//  DetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Tyson Parks on 2/26/18.
//  Copyright © 2018 Tyson Parks. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.detailScrollView setDelegate:self];
}


@end
