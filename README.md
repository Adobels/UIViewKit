# UIViewKit

UIViewKit is a Swift tool that makes designing and setting up UIKit views as simple as using InterfaceBuilder, but with Swift's strong type checks. It offers a look similar to SwiftUI and has lots of easy methods for attributes, outlets, and constraints. Thanks to the @resultBuilder attribute, the code is quick to write, looks cleaner, and is more pleasing to the eye.

## Key Features

- SwiftUI-Style Syntax for UIKit: Embrace SwiftUI's declarative approach, but tailored for UIKit.
- No More Storyboards/Xibs: Design UI directly in code, bypassing storyboards and xib files.
- Constraint Configuration Generator: Produce complex AutoLayout setups with a single method.
- Previews for Views & Controllers: Preview your UIKit views and controllers in code, just like SwiftUI views.

## How to Use

### Defining ViewController's View, with "Hello, world!" label

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

### Defining ViewController's View, Complex

```swift
class ViewControllerComplex: UIViewController {
    
    var labelTitle: UILabel!
    var labelsText: [UILabel] = []
    var button: UIButton = .init()
    var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view {
            UIStackView(axis: .vertical, spacing: 10, alignment: .center) { stackView in
                UILabel().ibOutlet(&labelTitle).ibAttributes {
                    $0.text = "Title"
                    $0.font = .init(name: "Arial", size: 30)
                }
                UIView() { superview in
                    UILabel().ibOutlet(in: &labelsText).ibAttributes {
                        $0.topAnchor.constraint(equalTo: superview.topAnchor)
                        $0.leftAnchor.constraint(equalTo: superview.leftAnchor)
                        $0.rightAnchor.constraint(equalTo: superview.rightAnchor)
                        $0.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
                        
                        $0.text = "Label 1"
                        $0.textColor = .red
                    }
                }
                UILabel().ibOutlet(in: &labelsText).ibAttributes {
                    $0.text = "Label 2"
                }
                UIView().ibAttributes {
                    $0.leftAnchor.constraint(equalTo: stackView.leftAnchor)
                    $0.heightAnchor.constraint(equalToConstant: 50).ibPriority(.defaultHigh - 1).ibOutlet(&heightConstraint)
                    
                    $0.backgroundColor = .yellow
                }
                UILabel().ibAttributes {
                    $0.text = "Label 3 Without Outlet"
                }
                UIButton().ibOutlet(&button).ibAttributes {
                    $0.widthAnchor.constraint(equalToConstant: 300)
                    
                    $0.setTitle("Button", for: .normal)
                    $0.backgroundColor = .blue
                    
                    $0.addTarget(self, action: #selector(didTap), for: .touchUpInside)
                }
            }.ibAttributes {
                $0.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                $0.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            }
        }
        
        labelsText.forEach { $0.text = "toto" }
    }
    
    @objc func didTap() {
        print(#function)
    }
}

#if DEBUG

import SwiftUI

struct ViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        PreviewViewController(ViewControllerComplex())
    }
}

#endif
```
