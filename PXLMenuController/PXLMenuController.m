//
//  PXLMenuController.m
//  Example
//
//  Created by Jason Silberman on 8/13/14.
//  Copyright (c) 2014 Jason Silberman. All rights reserved.
//

NSString *const PXLMenuControllerViewAlreadyLoadedException = @"PXLMenuControllerViewAlreadyLoadedException";

BOOL isiOS8() {
	#ifdef NSFoundationVersionNumber_iOS_7_1
		return YES;
	#else
		return NO;
	#endif
}

#import "PXLMenuController.h"

#import "PXLMenuItemCell.h"
#import "PXLMenuControllerAnimator.h"

@interface PXLMenuController () <UIViewControllerTransitioningDelegate, UIGestureRecognizerDelegate>

@property (nonatomic) BOOL viewLoaded;

@end

@implementation PXLMenuController

#pragma mark - Init

- (instancetype)initWithItems:(NSArray *)items placement:(PXLMenuControllerPlacement)placement {
	self = [super init];
	if (self) {
		_items = (items ? [items mutableCopy] : [@[] mutableCopy]);
		_placement = placement;
		
		_theme = [PXLMenuControllerTheme defaultTheme];
		
		self.transitioningDelegate = self;
		self.modalPresentationStyle = UIModalPresentationCustom;
	}
	return self;
}

#pragma mark - API

- (void)addItem:(PXLMenuItem *)item {
	if (! self.viewLoaded) {
		[self.items addObject:item];
	} else {
		[[NSException exceptionWithName:PXLMenuControllerViewAlreadyLoadedException reason:@"Cannot add items to already loaded view." userInfo:nil] raise];
	}
}

#pragma mark - UIView

- (void)viewDidLoad {
	[super viewDidLoad];
	self.viewLoaded = YES;
	
	[self.tableView registerClass:[PXLMenuItemCell class] forCellReuseIdentifier:@"PXLMenuItemCell"];
	
	self.view.backgroundColor = self.theme.backgroundColor;
	
	self.tableView.separatorInset = UIEdgeInsetsZero;
	
	UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backdropTapped:)];
	gestureRecognizer.delegate = self;
	[self.view addGestureRecognizer:gestureRecognizer];
	
	if (isiOS8()) {
		self.tableView.scrollEnabled = NO;
	}
	
	if (self.title) {
		CGRect requiredRect = [self.title boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.view.bounds), CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName : self.theme.menuItemFont} context:nil];
		NSInteger padding = 10;
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(padding, -(CGRectGetHeight(requiredRect) + padding), CGRectGetWidth(requiredRect), CGRectGetHeight(requiredRect))];
		label.backgroundColor = [UIColor clearColor];
		label.font = self.theme.menuItemFont;
		label.text = self.title;
		label.textColor = self.theme.titleColor;
		label.textAlignment = self.theme.menuItemTextAlignment;
		[self.view addSubview:label];
	}
}

#pragma mark - Actions

- (void)backdropTapped:(UITapGestureRecognizer *)gestureRecognizer {
	if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
		[self dismissViewControllerAnimated:YES completion:nil];
		if (self.cancelBlock) {
			self.cancelBlock();
		}
	}
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"PXLMenuItemCell";
	PXLMenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
	PXLMenuItem *item = [self.items objectAtIndex:indexPath.row];
	
	cell.textLabel.text = item.title;
	cell.textLabel.font = self.theme.menuItemFont;
	cell.textLabel.textAlignment = self.theme.menuItemTextAlignment;
	cell.textLabel.textColor = item.textColor;
	cell.textLabel.highlightedTextColor = item.selectedTextColor;
	
	cell.selectedBackgroundView = ({
		UIView *view = [UIView new];
		view.backgroundColor = item.tintColor;
		view;
	});
	
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	PXLMenuItem *item = [self.items objectAtIndex:indexPath.row];
	
	if (item.actionBlock) {
		item.actionBlock();
	}
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return self.theme.menuItemHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
	return [UIView new];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
	return ({
		PXLMenuControllerAnimator *animator = [PXLMenuControllerAnimator new];
		animator.reverse = NO;
		animator;
	});
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
	return ({
		PXLMenuControllerAnimator *animator = [PXLMenuControllerAnimator new];
		animator.reverse = YES;
		animator;
	});
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
	if (isiOS8()) {
		if (! [NSStringFromClass(touch.view.class) isEqualToString:@"UITableView"]) {
			return NO;
		}
	} else {
		if (! [NSStringFromClass(touch.view.class) isEqualToString:@"UITableViewWrapperView"]) {
			return NO;
		}
	}
	
    return YES;
}

@end
