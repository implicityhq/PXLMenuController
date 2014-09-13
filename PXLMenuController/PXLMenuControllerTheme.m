//
//  PXLMenuControllerTheme.m
//  Example
//
//  Created by Jason Silberman on 8/18/14.
//  Copyright (c) 2014 Jason Silberman. All rights reserved.
//

#import "PXLMenuControllerTheme.h"

@implementation PXLMenuControllerTheme

+ (instancetype)defaultTheme {
	PXLMenuControllerTheme *theme = [PXLMenuControllerTheme new];
	
	theme.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
	theme.menuItemFont = [UIFont systemFontOfSize:18];
	theme.menuItemHeight = 44.f;
	theme.menuItemTextAlignment = NSTextAlignmentLeft;
	theme.titleColor = [UIColor colorWithWhite:0.75 alpha:1.0];
	
	return theme;
}

@end
