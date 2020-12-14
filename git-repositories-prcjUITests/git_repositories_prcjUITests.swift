//
//  git_repositories_prcjUITests.swift
//  git-repositories-prcjUITests
//
//  Created by Paulo Cremonine on 09/12/20.
//

import XCTest

class git_repositories_prcjUITests: XCTestCase {
    let app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testScrollTable() throws {
        setupSnapshot(app)
        app.launch()
        snapshot("ScreenName")
        
        let table = app.tables.element(boundBy: 0)
        let cell = table.cells.element(boundBy: table.cells.count-1)
        table.scrollToElement(element: cell)
        
        XCTAssert(app.tables.staticTexts.count > 30, "Scroll infinito não executado")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                app.launch()
            }
        }
    }
}

extension XCUIElement {
    func scrollToElement(element: XCUIElement) {
        var i = 0
        while !element.visible() && i<10 {
            swipeUp(velocity: .fast)
            i+=1
        }
    }

    func visible() -> Bool {
        guard self.exists && !self.frame.isEmpty else { return false }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }
}
