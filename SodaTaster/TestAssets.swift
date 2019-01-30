//
//  TestAssets.swift
//  SodaTaster
//
//  Created by Roben Kleene on 1/30/19.
//  Copyright © 2019 Roben Kleene. All rights reserved.
//

import Foundation

public class TestAssets {

    public struct File {
        public let url: URL
        public let path: String
    }
    
    // MARK: Public
    
    // Assets
    public class var testHTMLJQUERY: File {
        return File(url: URL(string: "")!, path: "")
    }

    // MARK: Private
    
    // Assets
    private static let testHTMLJQUERYFilename = "indexjquery"
    private static let testJavaScriptFileExtension = "js"
    private static let testAssetsPathComponent = "TestAssets"
    private static let testJavaScriptPathComponent = testAssetsPathComponent.appending("js")
    
    // MARK: Private

    func url(forResource name: String,
             withExtension fileExtension: String,
             subdirectory: String) -> URL {

        guard let fileURL = Bundle(for: TestAssets.self).url(forResource: name, withExtension: fileExtension, subdirectory: subdirectory) else {
            assert(false)
            return URL(string: "")!
        }
        return fileURL
    }

}
