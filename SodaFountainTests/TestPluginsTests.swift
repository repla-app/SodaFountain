//
//  SodaFountainTests.swift
//  SodaFountainTests
//
//  Created by Roben Kleene on 5/25/17.
//  Copyright © 2017 Roben Kleene. All rights reserved.
//

@testable import SodaFountain
import XCTest

class TestPluginsTests: XCTestCase {
    func testPluginsDirectory() {
        let path = TestPlugins.testPluginsDirectoryPath
        let url = TestPlugins.testPluginsDirectoryURL

        guard let pathContents = try? FileManager.default.contentsOfDirectory(atPath: path) else {
            XCTFail()
            return
        }
        let pathContentsSet = Set(pathContents)

        guard let urls = try? FileManager.default.contentsOfDirectory(at: url,
                                                                      includingPropertiesForKeys: nil) else {
            XCTFail()
            return
        }
        let urlContents = urls.map { $0.lastPathComponent }
        let urlContentsSet = Set(urlContents)

        XCTAssertEqual(pathContentsSet, urlContentsSet)
        XCTAssertEqual(pathContentsSet, Set(TestPlugins.testPluginDirectoryNames))
    }

    func testPluginWithName() {
        for name in TestPlugins.testPluginNames {
            guard let url = TestPlugins.urlForPlugin(withName: name) else {
                XCTFail()
                return
            }
            guard let path = TestPlugins.pathForPlugin(withName: name) else {
                XCTFail()
                return
            }

            for path in [path, url.path] {
                var isDir: ObjCBool = false
                let exists = FileManager.default.fileExists(atPath: path,
                                                            isDirectory: &isDir)
                XCTAssertTrue(exists)
                XCTAssertTrue(isDir.boolValue)
            }
        }
    }

    func testNonexistantPlugin() {
        XCTAssertNil(TestPlugins.urlForPlugin(withName: TestPlugins.testPluginNameNonexistent))
        XCTAssertNil(TestPlugins.pathForPlugin(withName: TestPlugins.testPluginNameNonexistent))
    }
}
