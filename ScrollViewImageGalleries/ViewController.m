//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Tyson Parks on 2/26/18.
//  Copyright © 2018 Tyson Parks. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) NSMutableArray <UIImageView *> *imageViewsArray;
//@property (strong, nonatomic) UIImageView *lightHouseImageView;
@property (strong, nonatomic) UIImageView *imageTapped;

-(void)setupViewsExplicit;
-(void)setupViewsIterative;
//- (void)tapGesturePageView:(id)sender;
;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageViewsArray = [[NSMutableArray alloc]init];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setDelegate:self];
    
    [self setupViewsIterative];
    
    
    
}

-(void)setupViewsIterative {
    
        for (int i = 0; i<3; i++) {
    
            UIImageView *lightHouseImageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width * i), 0.0, self.view.frame.size.width, self.view.frame.size.height)];
            
            switch (i) {
                case 0:
                    lightHouseImageView.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
                    break;
    
                case 1:
                    lightHouseImageView.image = [UIImage imageNamed:@"Lighthouse-night"];
                    break;
                    
                case 2:
                    lightHouseImageView.image = [UIImage imageNamed:@"Lighthouse-zoomed"];
                    break;
              }
            [self.imageViewsArray addObject:lightHouseImageView];
            [self.scrollView addSubview:lightHouseImageView];
            
            [lightHouseImageView setUserInteractionEnabled:true];
            lightHouseImageView.contentMode = UIViewContentModeScaleAspectFit;
            UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturePageView:)];
            [lightHouseImageView addGestureRecognizer:tapRecognizer];
            
            }
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width * self.imageViewsArray.count, 0.0)];
    
}


- (void)tapGesturePageView:(UIGestureRecognizer *)sender {
//    self.imageTapped = self.lightHouseImageView;
    [self performSegueWithIdentifier:@"segue" sender:sender.view];
    
    NSLog(@"Hello");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segue"]) {
        DetailViewController *destinationViewController =  segue.destinationViewController;
        UIImageView *sourceImageView = sender;
        destinationViewController.currentImage = sourceImageView.image;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int currentPageIndex = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    self.pageControl.currentPage = currentPageIndex;
    NSLog(@"Current page index: %d", currentPageIndex);
}




-(void)setupViewsExplicit {
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
    
    lHInFieldView.contentMode = UIViewContentModeScaleAspectFit;
    lHNightView.contentMode = UIViewContentModeScaleAspectFit;
    lHZoomedView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.imageViewsArray addObject:lHInFieldView];
    [self.imageViewsArray addObject:lHNightView];
    [self.imageViewsArray addObject:lHZoomedView];
    
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width * self.imageViewsArray.count, 0.0)];
     
}

@end
