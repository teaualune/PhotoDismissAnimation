//
//  PDAPhotoViewController.m
//  PhotoDismissAnimation
//
//  Created by Teaualune Tseng on 13/1/10.
//  Copyright (c) 2013年 Teaualune Tseng. All rights reserved.
//

#import "PDAPhotoViewController.h"

@interface PDAPhotoViewController ()

@end

@implementation PDAPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.imageView.center = self.view.center;
    self.view.alpha = 0;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.view.alpha = 1;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dismiss:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        self.view.center = CGPointMake(self.view.center.x, self.view.center.y + self.view.frame.size.height);
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        self.view.center = self.view.superview.center;
        [self.view removeFromSuperview];
        self.view.alpha = 1;
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject]locationInView:self.view];
    
    offset = CGPointMake(self.imageView.center.x - point.x, self.imageView.center.y - point.y);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject]locationInView:self.view];
    
    point = CGPointMake(point.x + offset.x, point.y + offset.y);
    
    point.x = self.imageView.center.x;
    UITouch *touch = touches.anyObject;
    float range = point.y - self.view.center.y;
    range = range / self.view.frame.size.height;
    
    if (range < 0) {
        range = -range;
    }
    
    if([touch view] == self.view) {
        [UIView animateWithDuration:0.1 animations:^{
            [self.imageView setCenter: point];
            self.view.alpha = 1 - range;
        }];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    if([touch view] == self.view) {
        if (self.imageView.center.y > self.view.frame.size.height * 3 / 4 || self.imageView.center.y < self.view.frame.size.height / 4) {
            [self dismiss:nil];
        } else {
            [UIView animateWithDuration:0.5 animations:^{
                [self.imageView setCenter:self.view.center];
                self.view.alpha = 1;
            }];
        }
    }
}

@end
