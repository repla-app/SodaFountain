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
        let url = PotionTaster.pluginsDirectoryPath

        let pathContents = try! FileManager.default.contentsOfDirectory(atPath: path)




        NSLog("path = \(path)")

        NSLog("contents = \(pathContents)")

        // TODO: Test that the test plugins can be found at this path and this URL
    }

}
