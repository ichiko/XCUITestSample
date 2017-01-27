//
//  FirstViewTests.swift
//  XCUITestSampleUITests
//
//  Created by ichiko on 2015/11/15.
//  Copyright © 2015年 ichiko_revjune. All rights reserved.
//

import XCTest
@testable import XCUITestSample

class FirstViewTests: XCTestCase {
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCalculateWithoutNumber() {
        let app = XCUIApplication()
        app.buttons["CalculateButtonIdentifier"].tap()

        let resultLabel = app.staticTexts.element(boundBy: 2)
        // 見切れていても、設定されている文字列は等しくなる
        XCTAssertEqual(resultLabel.label, "計算できません")
        XCTAssertTrue(app.staticTexts["計算できません"].exists)
        screenshot("01_calculate1")
    }
    
    func testCalculate1() {
        let app = XCUIApplication()
        let textField = app.textFields["TextInputIdentifier"]
        textField.tap()
        textField.typeText("3")
        app.buttons["CalculateButtonIdentifier"].tap()
        let resultLabel = app.staticTexts.element(boundBy: 2)
        XCTAssertEqual(resultLabel.label, "6")
        XCTAssertTrue(app.staticTexts["6"].exists)
        screenshot("01_calculate1")
    }
    
    func testCalculate2() {
        let app = XCUIApplication()
        let textField = app.textFields["TextInputIdentifier"]
        textField.tap()
        textField.typeText("2")
        app.buttons["CalculateButtonIdentifier"].tap()
        
        let resultLabel = app.staticTexts.element(boundBy: 1)
        XCTAssertEqual(resultLabel.label, "4")
        
        let resultLabel2 = app.staticTexts["calculatedLabelIdentifier"]
        XCTAssertEqual(resultLabel2.label, "4")
        screenshot("02_calculate2")
    }
    
    func testSelectSegment() {
        let app = XCUIApplication()
        app.segmentedControls.buttons["Second"].tap()
        app.segmentedControls.buttons["First"].tap()
    }

    func testSlider() {
        let app = XCUIApplication()
        let progressslideridentifierSlider = app.sliders["ProgressSliderIdentifier"]
        progressslideridentifierSlider.tap()
        let progressLabel = app.staticTexts["SliderIdentifier"]
        XCTAssertEqual(progressLabel.label, "0.5")
        
        screenshot("04_slider_initialState")

        progressslideridentifierSlider.adjust(toNormalizedSliderPosition: 0.0)
        XCTAssertEqual(progressLabel.label, "0.0")
        
        progressslideridentifierSlider.adjust(toNormalizedSliderPosition: 1.0)
        XCTAssertEqual(progressLabel.label, "1.0")
        
        screenshot("04_slider_rightfull")

        progressslideridentifierSlider.adjust(toNormalizedSliderPosition: 0.0)
        XCTAssertEqual(progressLabel.label, "0.0")
        
        progressslideridentifierSlider.adjust(toNormalizedSliderPosition: 0.3)
        XCTAssertEqual(progressLabel.label, "0.3")
    }
}
