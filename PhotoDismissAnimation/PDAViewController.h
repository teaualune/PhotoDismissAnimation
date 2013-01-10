//
//  PDAViewController.h
//  PhotoDismissAnimation
//
//  Created by Teaualune Tseng on 13/1/10.
//  Copyright (c) 2013年 Teaualune Tseng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDAPhotoViewController.h"

@interface PDAViewController : UIViewController {
    IBOutlet UIImageView *imageView;
    UIView *fullView;
    UIImageView *fullImageView;
    PDAPhotoViewController *photoViewController;
}

-(void)showFullImage:(id)sender;

@end
