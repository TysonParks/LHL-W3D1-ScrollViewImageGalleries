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
    
    [self.scrollView setDelegate:self];

}

-(void)setupViews {
    for (inti = 0; i<3; i++) {
        [self.imageViewsArray addObject:<#(nonnull UIImageView *)#>];
        
    }
}

@end
