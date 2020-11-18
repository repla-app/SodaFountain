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
    func testDirectories() {
        let pluginDirectoryPathsSet = Set(TestPlugins.testPluginsDirectoryPaths)
        let pluginDirectoryPathsSetTwo = Set(TestPlugins.testPluginsDirectoryURLs.map { $0.path })
        XCTAssertEqual(pluginDirectoryPathsSet, pluginDirectoryPathsSetTwo)
        XCTAssertTrue(pluginDirectoryPathsSet.contains(TestPlugins.testBuiltInPluginsDirectoryPath))
    }

    func testPluginsDirectory() {
        let pluginDirectoryURLs = TestPlugins.testPluginsDirectoryURLs
        var directoryNames = [String]()

        for pluginDirectoryURL in pluginDirectoryURLs {
            guard let urls = try? FileManager.default.contentsOfDirectory(at: pluginDirectoryURL,
                                                                          includingPropertiesForKeys: nil)
            else {
                XCTFail()
                return
            }
            let lastPathComponents = urls.map { $0.lastPathComponent }
            directoryNames.append(contentsOf: lastPathComponents)
        }

        let pathComponentsSet = Set(directoryNames)
        XCTAssertEqual(pathComponentsSet, Set(TestPlugins.testPluginDirectoryNames))
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

    func testJSONPlugin() {
        XCTAssertNil(TestPlugins.urlForPlugin(withName: TestPlugins.testPluginNameJSON))
        XCTAssertNil(TestPlugins.pathForPlugin(withName: TestPlugins.testPluginNameJSON))
    }
    
    func testOutsidePlugin() {
        var isDir: ObjCBool = false
        var exists = FileManager.default.fileExists(atPath: TestPlugins.testOutsidePluginPath,
                                                    isDirectory: &isDir)
        XCTAssertTrue(exists)
        XCTAssertTrue(isDir.boolValue)
        exists = FileManager.default.fileExists(atPath: TestPlugins.testOutsidePluginURL.path,
                                                isDirectory: &isDir)
        XCTAssertTrue(exists)
        XCTAssertTrue(isDir.boolValue)
    }
}
