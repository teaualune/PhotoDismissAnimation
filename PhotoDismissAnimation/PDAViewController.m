//
//  PDAViewController.m
//  PhotoDismissAnimation
//
//  Created by Teaualune Tseng on 13/1/10.
//  Copyright (c) 2013年 Teaualune Tseng. All rights reserved.
//

#import "PDAViewController.h"


@interface PDAViewController ()

@end

@implementation PDAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showFullImage:)];
    [imageView addGestureRecognizer:gestureRecognizer];
    
    photoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PDAPhotoViewController"];
    photoViewController.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    [photoViewController.view addSubview:photoViewController.imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showFullImage:(id)sender
{
    UIImage *image = [UIImage imageNamed:@"appleA6.jpg"];
    photoViewController.imageView.image = image;
    
    CGRect frame = photoViewController.view.frame;
    photoViewController.view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    [self.view addSubview:photoViewController.view];
}

@end
