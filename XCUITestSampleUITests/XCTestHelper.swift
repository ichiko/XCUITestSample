//
//  XCTestHelper.swift
//  XCUITestSample
//
//  Created by ichiko on 2015/11/15.
//  Copyright © 2015年 ichiko_revjune. All rights reserved.
//

import XCTest

extension XCTestCase {
    func screenshot(_ name: String, waitForLoadingIndicator: Bool = true) {
        let fileName = NSString(format: "%@_%@", NSStringFromClass(type(of: self)), name) as String
        snapshot(fileName, waitForLoadingIndicator: waitForLoadingIndicator)
    }
}
