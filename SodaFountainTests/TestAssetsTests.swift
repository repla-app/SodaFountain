//
//  TestAssetsTests.swift
//  SodaTasterTests
//
//  Created by Roben Kleene on 1/30/19.
//  Copyright © 2019 Roben Kleene. All rights reserved.
//

@testable import SodaTaster
import XCTest

class TestAssetsTests: XCTestCase {
    func testAssets() {
        for asset in TestAssets.assets {
            var isDir: ObjCBool = false
            let exists = FileManager.default.fileExists(atPath: asset.path,
                                                        isDirectory: &isDir)
            XCTAssertTrue(exists)
            XCTAssertFalse(isDir.boolValue)
        }
    }
}
