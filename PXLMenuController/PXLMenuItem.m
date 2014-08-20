//
//  PXLMenuItem.m
//  Example
//
//  Created by Jason Silberman on 8/13/14.
//  Copyright (c) 2014 Jason Silberman. All rights reserved.
//

#import "PXLMenuItem.h"

@implementation PXLMenuItem

+ (instancetype)menuItemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor action:(PXLActionBlock)actionBlock {
	PXLMenuItem *item = [PXLMenuItem new];
	item.title = title;
	item.tintColor = tintColor;
	item.actionBlock = actionBlock;
	item.textColor = [UIColor blackColor];
	item.selectedTextColor = [UIColor whiteColor];
	return item;
}

@end
