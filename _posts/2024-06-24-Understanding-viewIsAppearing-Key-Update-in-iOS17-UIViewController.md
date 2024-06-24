# Understanding viewIsAppearing: A Key Update in iOS 17’s UIViewController

Created on: June 24, 2024
Last updated:
 
The basic life cycle of UIViewController consists of these three overridden methods:

- viewWillAppear(_:)
- viewDidAppear(_:)
- viewWillDisappear(_:)
- viewDidDisappear(_:)

Starting with iOS 17, this list is one method longer:

- viewWillAppear(_:)
- viewIsAppearing(_:)
- viewDidAppear(_:)
- viewWillDisappear(_:)
- viewDidDisappear(_:)

The viewIsAppearing method is back-deployed to iOS 13.

# What says Documentation

 The system calls this method once each time a view controller’s view appears after the `viewWillAppear(_:)` call. In contrast to `viewWillAppear(_:)`, the system calls this method after it adds the view controller’s view to the view hierarchy, and the superview lays out the view controller’s view. By the time the system calls this method, both the view controller and its view have received updated trait collections and the view has accurate geometry.

You can override this method to perform custom tasks associated with displaying the view. For example, you might use this method to configure or update views based on the trait collections of the view or view controller. Or, because computing a scroll position relies on the view’s size and geometry, you might programmatically scroll a collection or table view to ensure a selected cell is visible when the view appears.

### Choosing the appropriate callback

Although the system calls this method after `viewWillAppear(_:)`, both callbacks occur within the same `CATransaction`. This means that changes you make in either method become visible to the user at the same time.

The traits and geometry aren’t up to date when the system calls `viewWillAppear(_:)`, but they are when the system calls `viewIsAppearing(_:)`, so use `viewIsAppearing(_:)` to update your views.

Use `viewWillAppear(:_)` only when:

-   You need a callback before the view transition begins, such as when accessing the `transitionCoordinator` to add alongside animations. Alongside animations are animations that you direct the framework to perform concurrently with the view controller transition animations.
    
-   You need balanced callbacks to do something that doesn’t depend on the view controller or view traits, hierarchy, or geometry. Use cases include registering for database notifications in `viewWillAppear(_:)` and unregistering in `viewDidDisappear(_:)`.

For all other cases, use `viewIsAppearing(_:)` to update your views.

The system calls layout methods, such as `viewWillLayoutSubviews()` and `viewDidLayoutSubviews()`, whenever the view runs `layoutSubviews()`, which can happen multiple times during the transition, or at any time while the view is visible. However, the system calls `viewIsAppearing(_:)` only once during the appearance transition, and calls it even if the view doesn’t require laying out when it appears.

# Table Choosing the appropiate callback in UIViewController

|Callback| view.window | view.superview|view.traitsCollection up to date|view.safeAreaInsets up to date|view.frame up to date|view.subviews frames are up to date| Recursive subviews of view.subviews frames are up to date
--|--|--|--|--|--|--|--
loadView|false|false|false|false|false|false|false|false
viewDidLoad|false|false|false|false|false|false|false|false
viewWillAppear|false|true|false|false|true|false|false|false
updateViewConstraints|true|true|true|true|true|true|false|false
viewIsAppearing|true|true|true|true|true|true|false|false
viewWillLayoutSubviews|true|true|true|true|true|true|false|false
viewDidLayoutSubviews|true|true|true|true|true|true|true|false
viewDidAppear|true|true|true|true|true|true|true|true
viewWillDisappear|true|true|true|true|true|true|true|true
viewDidDisappear|false|true|true|true|true|true|true|true


# Personal Experience

- When documentation says that view has size up to date in viewIsAppearing(_:) method it does not mean that first level subviews or more generaly recoursive subiews of the view were layouted.

- SafaAreaInsets are up to date in viewIsAppearing(_:) method which is good news for all those logic which depended on it when positioning for example floting bottom buttons, buttons with different distances to bottom of screen depending if screen is with or without notch.

- Starting a custom loaders loading animations in viewIsAppearing(_:) works contrary to starting them in viewDidLoad()

# Known Issues

Due to the fact that the method is new and secondly back deployed to iOS 13, it's possible to have some issues

There are two know issues, first one is [viewIsAppearing not be called in children Controllers below iOS 16](https://forums.developer.apple.com/forums/thread/749169) posted on Apple's forum and second one is [Why is KeyboardLayoutGuide not applied in viewIsAppearing() in iOS 15.0?](https://stackoverflow.com/questions/78631184/why-is-keyboardlayoutguide-not-applied-in-viewisappearing-in-ios-15-0) posted on StackOverflow.

# Conclusions

viewIsAppearing can be a place for UI code which previously was present in viewWillAppear, updateViewConstraints, and viewDidAppear. To choose an appropriate presentation or layout callback, use the table introduced in the section ‘Table Choosing the appropriate callback in UIViewController’ by finding out the first callback which offers data needed for custom UI logic. Due to known issues, the code in viewIsAppearing should be well tested on iOS 16 and below. Important: viewIsAppearing, like other presentation callbacks, is executed only one time per presentation, but a view controller can be presented multiple times without being deinitialized, leading to code in those functions being called multiple times. To execute code only on the first-time call, use the CodeCallTracker framework.

# Execute code block on first Call in viewWillAppear function

Use [GitHub/Adobels/CodeCallTracker](https://github.com/Adobels/CodeCallTracker) to execute a block of code only on first execution of any method. It works great with UIViewController presentation and layout callbacks to execute a code for example in first call of viewWillAppear like that:

```swift
class ViewController: UIViewController {

    private let codeTracker = CodeCallTracker()

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated: animated)
            if codeTracker.isFirstTimeCall() {
                // do something only on first call of viewWillAppear
            } else {
                // do something on other calls of viewWillAppear
            }
    }
    override func viewIsAppearing(animated: Bool) {
	    super.viewIsAppearing(animated: animated)
        if codeTracker.isFirstTimeCall() {
            // do something only on first call of viewIsAppearing
        } else {
            // do something on other calls of viewIsAppearing
        }
    }
```

# Writing Xibs and Storyboards like SwiftUI

Use [Github/Adobels/UIViewKit](https://github.com/Adobels/UIViewKit) framwork to write your views like that:

```swift
class ViewController: UIViewController {

    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view {
            UILabel().ibOutlet(&label).ibAttributes {
                $0.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                $0.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                $0.text = "Hello, world!"
            }
        }
    }
}
```
