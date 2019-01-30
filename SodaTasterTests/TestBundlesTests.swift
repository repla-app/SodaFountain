//
//  SodaTasterTests.swift
//  SodaTasterTests
//
//  Created by Roben Kleene on 5/25/17.
//  Copyright © 2017 Roben Kleene. All rights reserved.
//

@testable import SodaTaster
import XCTest

class TestBundlesTests: XCTestCase {
    func testPluginsDirectory() {
        let path = SodaTaster.rootPluginsDirectoryPath
        let url = SodaTaster.rootPluginsDirectoryURL

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
        XCTAssertEqual(pathContentsSet, Set(SodaTaster.testRootPluginDirectoryNames))
    }

    func testPluginWithName() {
        for name in SodaTaster.testPluginNames {
            guard let url = SodaTaster.urlForPlugin(withName: name) else {
                XCTFail()
                return
            }
            guard let path = SodaTaster.pathForPlugin(withName: name) else {
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
        XCTAssertNil(SodaTaster.urlForPlugin(withName: SodaTaster.testPluginNameNonexistent))
        XCTAssertNil(SodaTaster.pathForPlugin(withName: SodaTaster.testPluginNameNonexistent))
    }
}
