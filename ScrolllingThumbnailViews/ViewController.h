//
//  ViewController.h
//  ScrolllingThumbnailViews
//
//  Created by Adithya Bhat on 02/02/12.
//

#import <UIKit/UIKit.h>
#import "ABScrollViewWithThumbnails.h"

@interface ViewController : UIViewController <ABScrollViewWithThumbnailsDelegate>
@property (retain, nonatomic) IBOutlet ABScrollViewWithThumbnails *ibHorizontalScrollView;
@property (retain, nonatomic) IBOutlet ABScrollViewWithThumbnails *ibVerticalScrollView;

@end
