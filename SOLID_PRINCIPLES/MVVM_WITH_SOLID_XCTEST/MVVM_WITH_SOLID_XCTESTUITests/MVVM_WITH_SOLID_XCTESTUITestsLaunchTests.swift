//
//  MVVM_WITH_SOLID_XCTESTUITestsLaunchTests.swift
//  MVVM_WITH_SOLID_XCTESTUITests
//
//  Created by Akash Revanna on 27/04/26.
//

import XCTest

final class MVVM_WITH_SOLID_XCTESTUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
