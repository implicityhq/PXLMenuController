PXLMenuController
=================

An easy way to present your users with a menu controller.

## Screenshots
![Screenshot of PXLMenuController](http://github.com/jasonsilberman/PXLMenuController/blob/master/screenshot.png)

## Documentation
You can check out the .h file [here](http://github.com/jasonsilberman/PXLMenuController/blob/master/PXLMenuController/PXLMenuController.h), or over on [Cocoadocs](http://cocoadocs.org/docsets/PXLMenuController/).

## Adding to Your Project
Getting started using PXLMenuController is really easy! You can use Cocoapods or you can do it manually.

### Using CocoaPods
Add the following to your `Podfile`.

```ruby
pod 'PXLMenuController'
```

### Manually
To manually add to your project:

1. Add the files in `PXLMenuController/` to your project.

PXLNetworking requires ARC.

## Usage
PXLMenuController is easy.

1. Create a couple `PXLMenuItem`.
2. Initialize and present a `PXLMenuController`.

Here is an example:

```objc
// Create a PXLMenuItem
PXLMenuItem *item = [PXLMenuItem menuItemWithTitle:@"Horay!" tintColor:[UIColor greenColor] action:^{
	NSLog(@"Horay tapped!");
}];

// Create a PXLMenuController
PXLMenuController *controller = [[PXLMenuController alloc] initWithItems:@[item] placement:PXLMenuControllerPlacementBottom];

// Set the theme (optional). It will use the `defaultTheme` if none is set.
controller.theme = [PXLMenuControllerTheme defaultTheme];

// Create another item
item = [PXLMenuItem menuItemWithTitle:@"Eh..." tintColor:[UIColor orangeColor] action:^{
	NSLog(@"Eh Tapped");
}];

// Add it
[controller addItem:item];

// Create another
item = [PXLMenuItem menuItemWithTitle:@"Grrrr" tintColor:[UIColor redColor] action:^{
	NSLog(@"Grrr tapped");
}];

// Add it again
[controller addItem:item];

// Set the cancel block (optional)
controller.cancelBlock = ^{
	NSLog(@"Canceled");
};

// Present it
[self presentViewController:controller animated:YES completion:nil];
```

## License
PXLMenuController is available under the MIT license. See the LICENSE file for more info.