//
//  ProTests.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 19/10/2023.
//

import XCTest
@testable import UIViewKit
@testable import UIViewDSL

// swiftlint:disable type_body_length
@MainActor
class ProTests: XCTestCase {

    private typealias SUT = UIView

    func testSingleSut() throws {
        let rootView = SUT()
        var sut: SUT!
        rootView.ibSubviews {
            SUT().ibOutlet(&sut)
        }
        XCTAssertEqual(rootView.subviews.count, 1)
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.subviews.count, Int.zero)
    }

    func testFirstLevel() throws {
        let rootView = SUT()
        var sut: SUT!

        rootView.ibSubviews {
            SUT().ibOutlet(&sut).ibSubviews {
                SUT()
                UILabel()
                UIImageView()
                UITextField()
                UITextView()
                UIButton()
                UIControl()
                UIScrollView()
                UITableView()
                UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
            }
        }

        XCTAssertTrue(sut.subviews[.zero].isMember(of: SUT.self))
        XCTAssertTrue(sut.subviews[1] is UILabel)
        XCTAssertTrue(sut.subviews[2] is UIImageView)
        XCTAssertTrue(sut.subviews[3] is UITextField)
        XCTAssertTrue(sut.subviews[4] is UITextView)
        XCTAssertTrue(sut.subviews[5] is UIButton)
        XCTAssertTrue(sut.subviews[6].isMember(of: UIControl.self))
        XCTAssertTrue(sut.subviews[7] is UIScrollView)
        XCTAssertTrue(sut.subviews[8] is UITableView)
        XCTAssertTrue(sut.subviews[9] is UICollectionView)
    }

    func testStackViewWithTwoLabels() throws {
        let rootView = SUT()
        var sut: SUT!
        var stackView: UIStackView!
        var label1: UILabel!
        var label2: UILabel!

        rootView.ibSubviews {
            SUT().ibOutlet(&sut).ibSubviews {
                UIStackView().ibOutlet(&stackView).ibSubviews {
                    UILabel().ibOutlet(&label1)
                    UILabel().ibOutlet(&label2)
                }
            }
        }

        XCTAssertTrue(sut.subviews[.zero] is UIStackView)
        XCTAssertTrue(sut.subviews[.zero].subviews[.zero] is UILabel)
        XCTAssertTrue(sut.subviews[.zero].subviews[1] is UILabel)
    }

    func testStackViewWithinStackViewWithTwoLabels() throws {
        let rootView = SUT()
        var sut: SUT!
        var stackView: UIStackView!
        var stackViewDetails: UIStackView!
        var label1: UILabel!
        var label2: UILabel!

        rootView.ibSubviews {
            SUT().ibOutlet(&sut).ibSubviews {
                UIStackView().ibOutlet(&stackView).ibSubviews {
                    UIStackView().ibOutlet(&stackViewDetails).ibSubviews {
                        UILabel().ibOutlet(&label1)
                        UILabel().ibOutlet(&label2)
                    }
                }
            }
        }

        XCTAssertTrue(sut.subviews[.zero] is UIStackView)
        XCTAssertTrue(sut.subviews[.zero].subviews[.zero] is UIStackView)
        XCTAssertTrue(sut.subviews[.zero].subviews[.zero].subviews[.zero] is UILabel)
        XCTAssertTrue(sut.subviews[.zero].subviews[.zero].subviews[1] is UILabel)
    }

    func testStackViewWithLabelScopedByMacroIf() throws {
        let rootView = SUT()
        var sut: SUT!
        var stackView: UIStackView!
        var label1: UILabel!
        var label2: UILabel!

        rootView.ibSubviews {
            SUT().ibOutlet(&sut).ibSubviews {
                UIStackView().ibOutlet(&stackView).ibSubviews {
#if FALSE
                    UILabel().ibOutlet(&label1)
#endif
                    UILabel().ibOutlet(&label2)
                }
            }
        }

        XCTAssertTrue(sut.subviews[.zero] is UIStackView)
        XCTAssertEqual(sut.subviews[.zero].subviews.count, 1)
        XCTAssertNil(label1)
        XCTAssertEqual(sut.subviews[.zero].subviews[.zero], label2)
    }

    func testStackViewWithLabelScopedByMacroIfElse() throws {
        let rootView = SUT()
        var sut: SUT!
        var stackView: UIStackView!
        #if FALSE
        var label1: UILabel!
        #else
        var label2: UILabel!
        #endif
        var label3: UILabel!

        rootView.ibSubviews {
            SUT().ibOutlet(&sut).ibSubviews {
                UIStackView().ibOutlet(&stackView).ibSubviews {
                    #if FALSE
                    UILabel().ibOutlet(&label1)
                    #else
                    UILabel().ibOutlet(&label2)
                    #endif
                    UILabel().ibOutlet(&label3)
                }
            }
        }

        XCTAssertTrue(sut.subviews[.zero] is UIStackView)
        XCTAssertEqual(sut.subviews[.zero].subviews.count, 2)
        #if FALSE
        XCTAssertNil(label1)
        #else
        XCTAssertEqual(sut.subviews[.zero].subviews[.zero], label2)
        #endif
        XCTAssertEqual(sut.subviews[.zero].subviews[1], label3)
    }

    func testStackViewWithLabelScopedByIfLet() throws {
        let rootView = SUT()
        var sut: SUT!
        var stackView: UIStackView!
        var label1: UILabel!
        var label2: UILabel!

        rootView.ibSubviews {
            SUT().ibOutlet(&sut).ibSubviews {
                UIStackView().ibOutlet(&stackView).ibSubviews {
                    if let _ = Optional([false].randomElement()!) { // swiftlint:disable:this unused_optional_binding
                        UILabel().ibOutlet(&label1)
                    }
                    UILabel().ibOutlet(&label2)
                }
            }
        }

        XCTAssertTrue(sut.subviews[.zero] is UIStackView)
        XCTAssertEqual(sut.subviews[.zero].subviews.count, 2)
        XCTAssertNotNil(label1)
        XCTAssertEqual(sut.subviews[.zero].subviews[.zero], label1)
        XCTAssertEqual(sut.subviews[.zero].subviews[1], label2)
    }

    func testStackViewWithLabelScopedByIf() throws {
        let rootView = SUT()
        var sut: SUT!
        var stackView: UIStackView!
        var label1: UILabel!
        var label2: UILabel!

        rootView.ibSubviews {
            SUT().ibOutlet(&sut).ibSubviews {
                UIStackView().ibOutlet(&stackView).ibSubviews {
                    if [false].randomElement()! {
                        UILabel().ibOutlet(&label1)
                    }
                    UILabel().ibOutlet(&label2)
                }
            }
        }

        XCTAssertTrue(sut.subviews[.zero] is UIStackView)
        XCTAssertEqual(sut.subviews[.zero].subviews.count, 1)
        XCTAssertNil(label1)
        XCTAssertEqual(sut.subviews[.zero].subviews[.zero], label2)
    }

    func testStackViewWithLabelScopedByIfElse() throws {
        let rootView = SUT()
        var sut: SUT!
        var stackView: UIStackView!
        var label1: UILabel!
        var label2: UILabel!
        var label3: UILabel!

        rootView.ibSubviews {
            SUT().ibOutlet(&sut).ibSubviews {
                UIStackView().ibOutlet(&stackView).ibSubviews {
                    if [false].randomElement()! {
                        UILabel().ibOutlet(&label1)
                    } else {
                        UILabel().ibOutlet(&label2)
                    }
                    UILabel().ibOutlet(&label3)
                }
            }
        }

        XCTAssertTrue(sut.subviews[.zero] is UIStackView)
        XCTAssertEqual(sut.subviews[.zero].subviews.count, 2)
        XCTAssertNil(label1)
        XCTAssertEqual(sut.subviews[.zero].subviews[.zero], label2)
        XCTAssertEqual(sut.subviews[.zero].subviews[1], label3)
    }

    func testExpressionsWhichReturnsVoid() throws {
        let rootView = SUT()
        var sut: SUT!
        var stackView: UIStackView!
        var label1: UILabel!
        var label2: UILabel!
        var label3: UILabel!

        rootView.ibSubviews {
            SUT().ibOutlet(&sut).ibSubviews {
                debugPrint()
                UIStackView().ibOutlet(&stackView).ibSubviews {
                    debugPrint()
                    if [false].randomElement()! {
                        debugPrint()
                        UILabel().ibOutlet(&label1)
                        debugPrint()
                    } else {
                        debugPrint()
                        UILabel().ibOutlet(&label2)
                        debugPrint()
                    }
                    debugPrint()
                    UILabel().ibOutlet(&label3)
                    debugPrint()
                }
            }
        }

        XCTAssertTrue(sut.subviews[.zero] is UIStackView)
        XCTAssertEqual(sut.subviews[.zero].subviews.count, 2)
        XCTAssertNil(label1)
        XCTAssertEqual(sut.subviews[.zero].subviews[.zero], label2)
        XCTAssertEqual(sut.subviews[.zero].subviews[1], label3)
    }

    func testSetConstraintsSingle() throws {
        let rootView = SUT()

        var sut: SUT!

        rootView.ibSubviews {
            SUT().ibOutlet(&sut).ibAttributes {
                $0.topAnchor.constraint(equalTo: rootView.topAnchor)
            }
        }

        XCTAssertEqual(rootView.constraints.count, 1)
        XCTAssertTrue(sut.constraints.isEmpty)
        XCTAssertTrue(try XCTUnwrap( UIViewDSLEngine.shared.constraintsToApplyForDebug.isEmpty))
    }

    func testSetConstraintsMultiple() throws {
        let rootView = SUT()

        var sut: SUT!

        rootView.ibSubviews {
            SUT().ibOutlet(&sut).ibAttributes {
                $0.topAnchor.constraint(equalTo: rootView.topAnchor)
                $0.leadingAnchor.constraint(equalTo: rootView.leadingAnchor)
                $0.trailingAnchor.constraint(equalTo: rootView.trailingAnchor)
                $0.bottomAnchor.constraint(equalTo: rootView.bottomAnchor)
            }
        }

        XCTAssertEqual(rootView.constraints.count, 4)
        XCTAssertTrue(sut.constraints.isEmpty)
        XCTAssertTrue(try XCTUnwrap( UIViewDSLEngine.shared.constraintsToApplyForDebug.isEmpty))
    }
}
// swiftlint:enable type_body_length
