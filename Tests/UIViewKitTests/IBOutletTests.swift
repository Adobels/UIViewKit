//
//  IBOutletTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 17/09/2023.
//

import XCTest

@MainActor
class IBOutletTests: XCTestCase {
    
    func testIBOutlet() throws {
        
        var label = UILabel()
        
        let newLabel = UILabel().ibOutlet(&label)
    
        XCTAssertEqual(label, newLabel)
    }
    
    func testIBOutletIn() throws {
        var labels: [UILabel] = []
        
        let newLabel = UILabel().ibOutlet(in: &labels)
        
        XCTAssertEqual(labels.count, 1)
        XCTAssertEqual(labels[.zero], newLabel)
    }
    
    func testIBOutletWithForceUnwrap() async throws {
        var label: UILabel!
        
        let newLabel = UILabel().ibOutlet(&label)
        
        XCTAssertEqual(label, newLabel)
    }
    
    func testIBOutletWithTrailingClosureOfIbSubviews() throws {
        
        var view = UIView()
        
        let newView = UIView().ibOutlet(&view) {
            UIView()
        }
    
        XCTAssertEqual(view, newView)
    }
    
    func testIBOutletInWithTrailingClosureOfIbSubviews() throws {
        var views: [UIView] = []
        
        let newView = UIView().ibOutlet(in: &views) {
            UIView()
        }
        
        XCTAssertEqual(views.count, 1)
        XCTAssertEqual(views[.zero], newView)
    }
    
    func testIBOutletWithForceUnwrapWithTrailingClosureOfIbSubviews() async throws {
        var view: UIView!
        
        let newView = UIView().ibOutlet(&view) {
            UIView()
        }
        
        XCTAssertEqual(view, newView)
    }
    
}
