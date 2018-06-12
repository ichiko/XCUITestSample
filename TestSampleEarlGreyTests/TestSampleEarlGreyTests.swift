//
//  TestSampleEarlGreyTests.swift
//  TestSampleEarlGreyTests
//
//  Created by ichiko-moro on 2018/06/11.
//  Copyright © 2018年 ichiko_revjune. All rights reserved.
//

import XCTest
import EarlGrey

class TestSampleEarlGreyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // To disable sending Google Analytics to Google
        GREYConfiguration.sharedInstance().setValue(false, forConfigKey: kGREYConfigKeyAnalyticsEnabled)

        let kMaxAnimationInterval: CFTimeInterval = 5.0
        GREYConfiguration.sharedInstance().setValue(kMaxAnimationInterval, forConfigKey: kGREYConfigKeyCALayerMaxAnimationDuration)
        GREYTestHelper.enableFastAnimation()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        EarlGrey.selectElement(with: grey_accessibilityID("CalculateButtonIdentifier"))
            .perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityLabel("計算できません")).atIndex(0).assert(grey_sufficientlyVisible())
    }

}
