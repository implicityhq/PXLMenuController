//
//  PXLMenuControllerAnimator.m
//  Example
//
//  Created by Jason Silberman on 8/13/14.
//  Copyright (c) 2014 Jason Silberman. All rights reserved.
//

#import "PXLMenuControllerAnimator.h"

#import "PXLMenuController.h"

@implementation PXLMenuControllerAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
	PXLMenuController *menuController;
	UIViewController *ownerViewController;
	
	if (! self.reverse) {
		menuController = (PXLMenuController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
		ownerViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	} else {
		menuController = (PXLMenuController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
		ownerViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	}
	
	UIView *containerView = [transitionContext containerView];
	containerView.backgroundColor = [UIColor blackColor];
	
	UIView *ownerViewSnapshot;
	if (! self.reverse) {
		ownerViewSnapshot = [ownerViewController.view snapshotViewAfterScreenUpdates:NO];
		
		[containerView addSubview:ownerViewSnapshot];
		[containerView addSubview:menuController.view];
	} else {
		ownerViewSnapshot = [containerView.subviews firstObject];
	}
	
	NSUInteger rowCount = menuController.items.count;
	CGFloat neededTableViewHeight = rowCount * menuController.tableView.rowHeight;
	
	if (! self.reverse) {
		menuController.tableView.clipsToBounds = YES;
		switch (menuController.placement) {
			case PXLMenuControllerPlacementBottom:
				menuController.view.frame = CGRectMake(0, CGRectGetHeight(containerView.frame), CGRectGetWidth(containerView.frame), CGRectGetHeight(containerView.frame));
				break;
			case PXLMenuControllerPlacementRight:
				menuController.tableView.contentInset = UIEdgeInsetsMake(((CGRectGetHeight(containerView.frame) - neededTableViewHeight) / 2), 0, 0, 0);
				menuController.view.frame = CGRectMake(CGRectGetWidth(containerView.frame), 0, CGRectGetWidth(containerView.frame), CGRectGetHeight(containerView.frame));
				break;
			case PXLMenuControllerPlacementLeft:
				menuController.tableView.contentInset = UIEdgeInsetsMake(((CGRectGetHeight(containerView.frame) - neededTableViewHeight) / 2), 0, 0, 0);
				menuController.view.frame = CGRectMake(-CGRectGetWidth(containerView.frame), 0, CGRectGetWidth(containerView.frame), CGRectGetHeight(containerView.frame));
				break;
		}
	}
	
	if (! self.reverse) {
		[UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.6f initialSpringVelocity:1.0f options:kNilOptions animations:^{
			if (menuController.placement == PXLMenuControllerPlacementBottom) {
				menuController.tableView.contentInset = UIEdgeInsetsMake((CGRectGetHeight(containerView.frame) - neededTableViewHeight), 0, 0, 0);
			}
			
			menuController.view.frame = containerView.frame;
		} completion:^(BOOL finished) {
			[transitionContext completeTransition:finished];
		}];
	} else {
		[UIView animateWithDuration:[self transitionDuration:transitionContext] / 2 animations:^{
			switch (menuController.placement) {
				case PXLMenuControllerPlacementBottom:
					menuController.view.frame = CGRectMake(0, CGRectGetHeight(containerView.frame), CGRectGetWidth(containerView.frame), CGRectGetHeight(containerView.frame));
					break;
				case PXLMenuControllerPlacementRight:
					menuController.view.frame = CGRectMake(CGRectGetWidth(containerView.frame), 0, CGRectGetWidth(containerView.frame), CGRectGetHeight(containerView.frame));
					break;
				case PXLMenuControllerPlacementLeft:
					menuController.view.frame = CGRectMake(-CGRectGetWidth(containerView.frame), 0, CGRectGetWidth(containerView.frame), CGRectGetHeight(containerView.frame));
					break;
			}
		} completion:^(BOOL finished) {
			[transitionContext completeTransition:finished];
		}];
	}
	
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
	return 0.55;
}

@end
