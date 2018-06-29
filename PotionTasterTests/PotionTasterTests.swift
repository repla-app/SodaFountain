//
//  PotionTasterTests.swift
//  PotionTasterTests
//
//  Created by Roben Kleene on 5/25/17.
//  Copyright © 2017 Roben Kleene. All rights reserved.
//

@testable import PotionTaster
import XCTest

class PotionTasterTests: XCTestCase {
    func testPluginsDirectory() {
        let path = PotionTaster.rootPluginsDirectoryPath
        let url = PotionTaster.rootPluginsDirectoryURL

        let pathContents = try! FileManager.default.contentsOfDirectory(atPath: path)
        let pathContentsSet = Set(pathContents)

        let urls = try! FileManager.default.contentsOfDirectory(at: url,
                                                                includingPropertiesForKeys: nil)
        let urlContents = urls.map { $0.lastPathComponent }
        let urlContentsSet = Set(urlContents)

        XCTAssertEqual(pathContentsSet, urlContentsSet)
        XCTAssertEqual(pathContentsSet, Set(PotionTaster.testRootPluginDirectoryNames))
    }

    func testPluginWithName() {
        for name in PotionTaster.testPluginNames {
            guard let url = PotionTaster.urlForPlugin(withName: name) else {
                XCTFail()
                return
            }
            guard let path = PotionTaster.pathForPlugin(withName: name) else {
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
        XCTAssertNil(PotionTaster.urlForPlugin(withName: PotionTaster.testPluginNameNonexistent))
        XCTAssertNil(PotionTaster.pathForPlugin(withName: PotionTaster.testPluginNameNonexistent))
    }
}
