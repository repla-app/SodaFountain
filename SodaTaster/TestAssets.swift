//
//  TestAssets.swift
//  SodaTaster
//
//  Created by Roben Kleene on 1/30/19.
//  Copyright © 2019 Roben Kleene. All rights reserved.
//

import Foundation

public class TestAssets: AssetSource {
    public struct File {
        public let url: URL
        public var path: String {
            return url.path
        }
    }

    // MARK: Public

    // Assets
    public static let testTitleJavaScript = File(url: url(forResource: testTitleJavaScriptFilename,
                                                          withExtension: testJavaScriptFileExtension,
                                                          subdirectory: testJavaScriptPathComponent))
    public static let testHTMLJQUERY = File(url: url(forResource: testHTMLJQUERYFilename,
                                                     withExtension: testHTMLFileExtension,
                                                     subdirectory: testHTMLPathComponent))
    public static let testHTML = File(url: url(forResource: testHTMLFilename,
                                               withExtension: testHTMLFileExtension,
                                               subdirectory: testHTMLPathComponent))
    public static let testTextJQUERYJavaScript = File(url: url(forResource: testTextJQUERYJavaScriptFilename,
                                                               withExtension: testJavaScriptFileExtension,
                                                               subdirectory: testJavaScriptPathComponent))
    public static let testTextJavaScript = File(url: url(forResource: testTextJavaScriptFilename,
                                                         withExtension: testJavaScriptFileExtension,
                                                         subdirectory: testJavaScriptPathComponent))

    static let assets = [
        testHTML,
        testHTMLJQUERY,
        testTextJQUERYJavaScript,
        testTextJavaScript,
        testTitleJavaScript
    ]

    // MARK: Private

    // Assets
    private static let testHTMLJQUERYFilename = "indexjquery"
    private static let testTextJQUERYJavaScriptFilename = "textjquery"
    private static let testTextJavaScriptFilename = "text"
    private static let testHTMLFilename = "index"
    private static let testTitleJavaScriptFilename = "title"
    private static let testJavaScriptFileExtension = "js"
    private static let testHTMLFileExtension = "html"
    private static let testJavaScriptPathComponent = assetPathcomponent.appending("js")
    private static let testHTMLPathComponent = assetPathcomponent.appending("html")

    // Helper
    private static func url(forResource name: String,
                            withExtension fileExtension: String,
                            subdirectory: String) -> URL {
        guard let fileURL = Bundle(for: TestAssets.self).url(forResource: name,
                                                             withExtension: fileExtension,
                                                             subdirectory: subdirectory) else {
            assert(false)
            return URL(string: "")!
        }
        return fileURL
    }
}
