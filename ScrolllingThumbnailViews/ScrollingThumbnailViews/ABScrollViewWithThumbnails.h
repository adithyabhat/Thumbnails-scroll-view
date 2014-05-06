//
//  ABScrollViewWithThumbnails.h
//  ScrolllingThumbnailViews
//
//  Created by Adithya Bhat on 02/02/12.
//

/*************************************************************************
 This view creates a scrollable view of thumbnail views. The controller
 making use of this view has to implements ABScrollViewWithThumbnailsDelegate
 protocol.
 
 Thumbnail views can have a tap gesture reconginizer. Also a shadow can be 
 applied for the view.
 
 Delegate functions
**************************************************************************/

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define TAG_OFFSET 200      //Each thumbnail view is assigned a tag which is its index position in the scrollview. Tag offset is added to that tag just to avoid mixing of tags with the internal system tags. So if any views is to be accessed by means of tag, then this tag offset should be added to the views index value.  

#define SHADOW_OFFSET 3     //This defines the extent of shadow for the view.

typedef enum
{
    eHorizontalScroll,
    eVerticalScroll
} ScrollType;


//Protocol
@protocol ABScrollViewWithThumbnailsDelegate <NSObject>

/*************************************************************************
 This delegate should return the no of columns of thumbnail views to be
 displayed in a page
 *************************************************************************/
-(NSInteger)noOfColumnsPerPageInScrollView :(UIScrollView*)scrollView;

/*************************************************************************
 Should return side padding between 2 thumbnail views
 *************************************************************************/
-(NSInteger)sidePaddingBetweenTheThumbnailsInScrollView :(UIScrollView*)scrollView;

/*************************************************************************
 Should return side padding value between 2 thumbnail views
 *************************************************************************/
-(NSInteger)upperPaddingForTheThumbnailsInScrollView :(UIScrollView*)scrollView;

/*************************************************************************
 Should retunrs the height of the thumbnail view required
 *************************************************************************/
-(NSInteger)heightOfThumbnailsInScrollView :(UIScrollView*)scrollView;

/*************************************************************************
 Should return if shadow should be applied for thumbnail view or not
 *************************************************************************/
-(BOOL)applyShadowForEachThumbnailViewInScrollView :(UIScrollView*)scrollView;

/*************************************************************************
 Should return if the tap gesture recongnizer is required for the thumbnail
 view.
 *************************************************************************/
-(BOOL)isTapGestureReconginizedForThumbnailNailsInScrollView :(UIScrollView*)scrollView;

/*************************************************************************
 Should return a BOOL value indicating if scrolling is horizontal or
 vertical.
 *************************************************************************/
-(BOOL)isScrollVerticalInScrollView :(UIScrollView*)scrollView;

/*************************************************************************
 This delegate function should initialize the tap gesture recongnizer with
 target and selector function.
 *************************************************************************/
-(void)initTapGestureRecognizer :(UITapGestureRecognizer*)gestureRecognizer;

/*************************************************************************
 This retunrs the data source array. It should contain the views that are
 to be added to the scrollview.
 *************************************************************************/
-(NSArray*)arrayOfElementsToBeDisplayedInScrollView :(UIScrollView*)scrollView;

@end

@interface ABScrollViewWithThumbnails : UIScrollView

@property (assign, nonatomic) IBOutlet id delegate;
@property (retain, nonatomic) IBOutlet id datasource;

/*************************************************************************
 Loads the thumbnail views to the scrollview. 
 *************************************************************************/
-(void)loadThumbnailViewsWithObjectsOfClass :(Class)objectClass;

@end
