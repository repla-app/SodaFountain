//
//  PotionTasterTests.swift
//  PotionTasterTests
//
//  Created by Roben Kleene on 5/25/17.
//  Copyright © 2017 Roben Kleene. All rights reserved.
//

import XCTest
@testable import PotionTaster

class PotionTasterTests: XCTestCase {
    
    func testPlugins() {
        let path = PotionTaster.pluginsDirectoryPath
        let url = PotionTaster.pluginsDirectoryURL

        let pathContents = try! FileManager.default.contentsOfDirectory(atPath: path)
        let pathContentsSet = Set(pathContents)

        let urlContents = try! FileManager.default.contentsOfDirectory(at: url,
                                                                       includingPropertiesForKeys: nil)
        let urlContentsSet = Set(urlContents)

//        XCTAssertEqual(pathContentsSet, urlContentsSet)
        XCTAssertEqual(pathContentsSet, Set(PotionTaster.testPluginDirectoryNames))

        NSLog("path = \(path)")
        NSLog("pathContents = \(pathContents)")

        NSLog("urlContents = \(urlContents)")


        // TODO: Test that the test plugins can be found at this path and this URL
    }

}
