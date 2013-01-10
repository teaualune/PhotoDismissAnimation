//
//  PDAPhotoViewController.h
//  PhotoDismissAnimation
//
//  Created by Teaualune Tseng on 13/1/10.
//  Copyright (c) 2013年 Teaualune Tseng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDAPhotoViewController : UIViewController
{
    CGPoint offset;
}

@property (strong, nonatomic) UIImageView *imageView;

-(IBAction)dismiss:(id)sender;

@end
