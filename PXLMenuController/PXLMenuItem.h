//
//  PXLMenuItem.h
//  Example
//
//  Created by Jason Silberman on 8/13/14.
//  Copyright (c) 2014 Jason Silberman. All rights reserved.
//

@import Foundation;
@import UIKit;

typedef void(^PXLActionBlock)(void);

@interface PXLMenuItem : NSObject

/*
 The title of the PXLMenuItem.
 */
@property (nonatomic) NSString *title;

/*
 The tintColor of the PXLMenuItem. Used as a background color when item is selected.
 */
@property (nonatomic) UIColor *tintColor;

/*
 The textColor of the PXLMenuItem.
 
 Default: [UIColor blackColor]
 */
@property (nonatomic) UIColor *textColor;

/*
 The textColor of the PXLMenuItem when selected.
 
 Default: [UIColor whiteColor]
 */
@property (nonatomic) UIColor *selectedTextColor;

/*
 The block to be called when an item is selected.
 */
@property (nonatomic, copy) PXLActionBlock actionBlock;

/*
 Initialize a PXLMenuItem.
 
 @param title The title of the item.
 @param tintColor The tint color of the item. Used as a background color when item is selected.
 @param actionBlock The block to be called when an item is selected.
 
 @return An initialized PXLMenuItem.
 */
+ (instancetype)menuItemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor action:(PXLActionBlock)actionBlock;

@end
