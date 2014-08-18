//
//  PXLMenuControllerTheme.h
//  Example
//
//  Created by Jason Silberman on 8/18/14.
//  Copyright (c) 2014 Jason Silberman. All rights reserved.
//

@import Foundation;

@interface PXLMenuControllerTheme : NSObject

/*
 The PXLMenuController background color.
 
 Default: [UIColor colorWithWhite:1.0 alpha:0.8]
 */
@property (nonatomic) UIColor *backgroundColor;

/*
 The PXLMenuItem's font.
 
 Default: [UIFont systemFontOfSize:18]
 */
@property (nonatomic) UIFont *menuItemFont;

/*
 The PXLMenuItem's height.
 
 Default: 44.f
 */
@property (nonatomic, assign) CGFloat menuItemHeight;

/*
 The PXLMenuItem's text alignment.
 
 Default: NSTextAlignmentLeft
 */
@property (nonatomic, assign) NSTextAlignment menuItemTextAlignment;

/*
 The default theme to be used if none is set.
 */
+ (instancetype)defaultTheme;

@end
