//
//  PXLMenuController.h
//  Example
//
//  Created by Jason Silberman on 8/13/14.
//  Copyright (c) 2014 Jason Silberman. All rights reserved.
//

@import UIKit;

#import "PXLMenuItem.h"
#import "PXLMenuControllerTheme.h"

typedef NS_ENUM(NSInteger, PXLMenuControllerPlacement) {
	PXLMenuControllerPlacementBottom,
	PXLMenuControllerPlacementRight,
	PXLMenuControllerPlacementLeft
};

@interface PXLMenuController : UITableViewController

/*
 Items
 */
@property (nonatomic) NSMutableArray *items;

/*
 Positioning
 */
@property (nonatomic, assign) PXLMenuControllerPlacement placement;

/*
 Cancel Block
 */
@property (nonatomic, assign) PXLActionBlock cancelBlock;

/*
 Theming
 */
@property (nonatomic) PXLMenuControllerTheme *theme;

/*
 Title
 */
@property (nonatomic) NSString *title;

/*
 Initialize PXLMenuController
 
 @param items An array of PXLMenuItems.
 @param placement The placement of the menu controller.
 
 @return An initialized PXLMenuController.
 */
- (instancetype)initWithItems:(NSArray *)items placement:(PXLMenuControllerPlacement)placement;


/*
 Add an item to the menu controller
 
 @param item The PXLMenuItem to add.
 */
- (void)addItem:(PXLMenuItem *)item;

@end
