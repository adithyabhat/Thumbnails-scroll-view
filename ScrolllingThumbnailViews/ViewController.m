//
//  ViewController.m
//  ScrolllingThumbnailViews
//
//  Created by Adithya Bhat on 02/02/12.
//

#import "ViewController.h"

@implementation ViewController
@synthesize ibHorizontalScrollView;
@synthesize ibVerticalScrollView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.ibHorizontalScrollView loadThumbnailViewsWithObjectsOfClass:[UIImageView class]];
    [self.ibVerticalScrollView loadThumbnailViewsWithObjectsOfClass:[UIImageView class]];

}

- (void)viewDidUnload
{
    [self setIbHorizontalScrollView:nil];
    [self setIbVerticalScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(NSInteger)noOfColumnsPerPageInScrollView:(UIScrollView *)scrollView
{
    if(scrollView == ibHorizontalScrollView)
        return 2;
    else return 2;
}

-(NSInteger)sidePaddingBetweenTheThumbnailsInScrollView:(UIScrollView *)scrollView
{
    if(scrollView == ibHorizontalScrollView)
        return 20;
    else return 10;
}

-(NSInteger)upperPaddingForTheThumbnailsInScrollView:(UIScrollView *)scrollView
{
    if(scrollView == ibHorizontalScrollView)
        return 15;
    else return 20;
}

-(NSInteger)heightOfThumbnailsInScrollView:(UIScrollView *)scrollView
{
    return 80;
}

-(BOOL)applyShadowForEachThumbnailViewInScrollView:(UIScrollView *)scrollView
{
    return YES;
}

-(BOOL)isTapGestureReconginizedForThumbnailNailsInScrollView:(UIScrollView *)scrollView
{
    return YES;
}

-(BOOL)isScrollVerticalInScrollView:(UIScrollView *)scrollView
{
    if(scrollView == self.ibVerticalScrollView)
        return eVerticalScroll;
    else 
        return eHorizontalScroll;
}

-(void)tapGestureHandler: (UITapGestureRecognizer*)gesture
{
    NSInteger tag = gesture.view.tag;
    NSLog(@"View with tag %d tapped",tag);
}

-(void)initTapGestureRecognizer:(UITapGestureRecognizer *)gestureRecognizer
{
    [gestureRecognizer addTarget:self action:@selector(tapGestureHandler:)];
}

-(NSArray*)arrayOfElementsToBeDisplayedInScrollView:(UIScrollView *)scrollView
{
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    
    for(int index=0;index<5;index++)
    {
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d_small.jpg",index+1]]];
        [array addObject:img];
        [img release];
    }
    
    return array;
}



- (void)dealloc {
    [ibHorizontalScrollView release];
    [ibVerticalScrollView release];
    [super dealloc];
}
@end
