//
//  ABScrollViewWithThumbnails.m
//  ScrolllingThumbnailViews
//
//  Created by Adithya Bhat on 02/02/12.
//

#import "ABScrollViewWithThumbnails.h"

@implementation ABScrollViewWithThumbnails

@synthesize delegate;
@synthesize datasource;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)dealloc
{
    [delegate release];
    [datasource release];
    
    [super dealloc];
}

/*************************************************************************
 Loads the thumbnail views to the scrollview. 
 *************************************************************************/

-(void)loadThumbnailViewsWithObjectsOfClass :(Class)objectClass
{
    //Thumbnail container height and width includes the thumbnail height and width along with the padding value.
    CGFloat thumbnailContainerWidth;
    CGFloat thumbnailContainerHeight;
    
    NSInteger noOfColumnsPerPage = [self.delegate noOfColumnsPerPageInScrollView:self];  //Get info about no of columns to be displayed
    NSInteger sidePadding = [self.delegate sidePaddingBetweenTheThumbnailsInScrollView:self]; //Get info about Side padding
    NSInteger upperPadding = [self.delegate upperPaddingForTheThumbnailsInScrollView:self]; //Get info about upper padding
    NSInteger heightOfThumbnail = [self.delegate heightOfThumbnailsInScrollView:self]; //Get info about height of the thumbnail view

    NSArray *dataSourceArray = [self.datasource arrayOfElementsToBeDisplayedInScrollView:self];//Get the dat source of the views to be displayed in the scrollview



    ScrollType scrollType = [self.delegate isScrollVerticalInScrollView:self];
    
    if(scrollType == eHorizontalScroll)
    {
        thumbnailContainerWidth=self.frame.size.width/noOfColumnsPerPage;
        thumbnailContainerHeight=self.frame.size.height;
        
        //Setting content size of the scrollview for horizontal scroll
        self.contentSize = CGSizeMake([dataSourceArray count]*thumbnailContainerWidth, thumbnailContainerHeight);
    }
    else
    {
        //Thumbnail container height and width includes the thumbnail height and width along with the padding value.
        thumbnailContainerWidth=self.frame.size.width;
        thumbnailContainerHeight=self.frame.size.height/noOfColumnsPerPage;
        
        //Setting content size of the scrollview for vertical scroll
        self.contentSize = CGSizeMake(thumbnailContainerWidth, [dataSourceArray count]*thumbnailContainerHeight);
    }

    //Check if shadow is required for the views
    BOOL applyShadowStatus = NO;
    if([self.delegate respondsToSelector:@selector(applyShadowForEachThumbnailViewInScrollView:)])
        applyShadowStatus = [self.delegate applyShadowForEachThumbnailViewInScrollView:self];
    
    //If tap gesture recongnizer required or not
    BOOL tapGestureReconginized = NO;
    if([self.delegate respondsToSelector:@selector(isTapGestureReconginizedForThumbnailNailsInScrollView:)])
        tapGestureReconginized = [self.delegate isTapGestureReconginizedForThumbnailNailsInScrollView:self];
    
    for(int index=0;index<[dataSourceArray count];index++)
    {
        UIView<ABScrollViewWithThumbnailsDelegate> *thumbnailView = [dataSourceArray objectAtIndex:index];
        
        if(scrollType == eHorizontalScroll)
            //Set frame for the thumbnail with horizontal scroll
            thumbnailView.frame = CGRectMake(index*thumbnailContainerWidth+sidePadding, upperPadding, thumbnailContainerWidth - (2*sidePadding), heightOfThumbnail);
        else
            //Set frame for the thumbnail with vertical scroll
            thumbnailView.frame = CGRectMake(sidePadding, index*thumbnailContainerHeight+upperPadding, thumbnailContainerWidth - (2*sidePadding), heightOfThumbnail);

        thumbnailView.tag = index+TAG_OFFSET;
        
        //Adding tap gesture recongnizer
        if(tapGestureReconginized)
        {
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
            [thumbnailView addGestureRecognizer:tapGestureRecognizer];
            [thumbnailView setUserInteractionEnabled:YES];
            [self.delegate initTapGestureRecognizer:tapGestureRecognizer];
            [tapGestureRecognizer release];
        }
     
        //Shadow for the view
        if(applyShadowStatus == YES)
        {
            UIImageView *shadowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundShadow.png"]];
            shadowView.contentMode = UIViewContentModeScaleToFill;
            CGRect imageViewFrame = thumbnailView.frame;
            shadowView.frame = CGRectMake(imageViewFrame.origin.x + SHADOW_OFFSET, imageViewFrame.origin.y + SHADOW_OFFSET, imageViewFrame.size.width, imageViewFrame.size.height);
            [self addSubview:shadowView];
            [shadowView release];
        }
        
        [self addSubview:thumbnailView];    //Add thumbnail to the view
    }
}

@end
