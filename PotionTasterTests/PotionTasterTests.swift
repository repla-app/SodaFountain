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
    
    func testPluginsDirectory() {
        let path = PotionTaster.pluginsDirectoryPath
        let url = PotionTaster.pluginsDirectoryURL

        let pathContents = try! FileManager.default.contentsOfDirectory(atPath: path)
        let pathContentsSet = Set(pathContents)

        let urls = try! FileManager.default.contentsOfDirectory(at: url,
                                                                includingPropertiesForKeys: nil)
        let urlContents = urls.map { $0.lastPathComponent }
        let urlContentsSet = Set(urlContents)

        XCTAssertEqual(pathContentsSet, urlContentsSet)
        XCTAssertEqual(pathContentsSet, Set(PotionTaster.testPluginDirectoryNames))
    }

    func testPluginWithName() {
        for name in PotionTaster.testPluginNames {
            let url = PotionTaster.urlForPlugin(withName: name)
            let path = PotionTaster.pathForPlugin(withName: name)

            XCTAssertNotNil(url)
            XCTAssertNotNil(path)
        }
    }
}
