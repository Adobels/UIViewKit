//
//  CreateMultipleViewsSimultaneouslyTests.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 20/11/2023.
//

import XCTest
@testable import UIViewKit

class CreateMultipleViewsSimultaneouslyTests: XCTestCase {

    // swiftlint:disable:next function_body_length
    func testCreateMultipleViewsSimultaneously() throws {

        let exp1 = expectation(description: "exp1")
        let exp2 = expectation(description: "exp2")
        let exp3 = expectation(description: "exp3")

        DispatchQueue.global().async {
            DispatchQueue.main.async {
                UIView().ibSubviews { superview in
                    UIView().ibSubviews { superview in
                        UIView().ibSubviews { superview in
                            UIView().ibSubviews { superview in
                                UIView().ibSubviews { superview in
                                    UIView().ibSubviews { _ in
                                        UILabel()
                                    }.ibAttributes {
                                        ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                                    }
                                }.ibAttributes {
                                    ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                                }
                            }.ibAttributes {
                                ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                            }
                        }.ibAttributes {
                            ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                        }
                    }.ibAttributes {
                        ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                    }
                }.ibAttributes { _ in
                    exp1.fulfill()
                }
            }
        }

        DispatchQueue.global().async {
            DispatchQueue.main.async {
                UIView().ibSubviews { superview in
                    UIView().ibSubviews { superview in
                        UIView().ibSubviews { superview in
                            UIView().ibSubviews { superview in
                                UIView().ibSubviews { superview in
                                    UIView().ibSubviews { _ in
                                        UILabel()
                                    }.ibAttributes {
                                        ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                                    }
                                }.ibAttributes {
                                    ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                                }
                            }.ibAttributes {
                                ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                            }
                        }.ibAttributes {
                            ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                        }
                    }.ibAttributes {
                        ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                    }
                }.ibAttributes { _ in
                    exp2.fulfill()
                }
            }
        }

        DispatchQueue.global().async {
            DispatchQueue.main.async {
                UIView().ibSubviews { superview in
                    UIView().ibSubviews { superview in
                        UIView().ibSubviews { superview in
                            UIView().ibSubviews { superview in
                                UIView().ibSubviews { superview in
                                    UIView().ibSubviews { _ in
                                        UILabel()
                                    }.ibAttributes {
                                        ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                                    }
                                }.ibAttributes {
                                    ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                                }
                            }.ibAttributes {
                                ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                            }
                        }.ibAttributes {
                            ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                        }
                    }.ibAttributes {
                        ibConstraints(from: $0, to: superview, guide: .viewSafeArea, anchors: .all)
                    }
                }.ibAttributes { _ in
                    exp3.fulfill()
                }
            }
        }
        wait(for: [exp1, exp2, exp3])
    }
}
