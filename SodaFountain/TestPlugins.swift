//
//  TestPlugins.swift
//  SodaFountain
//
//  Created by Roben Kleene on 1/30/19.
//  Copyright © 2019 Roben Kleene. All rights reserved.
//

import Foundation

public class TestPlugins: AssetSource {
    // MARK: Public

    // Plugins

    // Ruby
    public static let testPluginNameCat = "Cat"
    public static let testPluginCommandCat = "cat.sh"
    public static let testPluginNameHelloWorld = "HelloWorld"
    public static let testPluginNameInvalid = "Invalid"
    public static let testPluginNamePrint = "Print"
    public static let testPluginNameEcho = "Echo"
    public static let testPluginCommandPrint = "print.rb"
    public static let testPluginNameTestEnvironment = "TestEnvironment"
    public static let testPluginNameTestLog = "TestLog"
    public static let testPluginNameTestFileExtension = "FileExtension"
    public static let testPluginNameTestPromptInterrupt = "PromptInterrupt"
    public static let testPluginNameTestServer = "TestServer"

    // Node
    public static let testPluginNameTestNode = "TestNode"
    public static let testPluginCommandTestNode = "App.js"

    // Special
    public static let testPluginNameNonexistent = "Nonexistent"
    public static let testPluginNameOutside = "Data"
    public static let testPluginNameOutsidePathComponent = "Assets/repla-ruby/test/data"

    // Metadata
    public static let testPluginFileExtension = "replaplugin"

    // Collections
    public static let testPluginDirectoryNames = testPluginNames.map {
        "\($0).\(testPluginFileExtension)"
    }

    // Generic

    public static let testPluginName = testPluginNameCat
    public static let testPluginNameTwo = testPluginNamePrint
    public static let testPluginNameOtherDirectory = testPluginNameTestNode
    public static let testPluginCommand = testPluginCommandCat
    public static let testPluginCommandTwo = testPluginCommandPrint
    public static let testPluginCommandOtherDirectory = testPluginCommandTestNode
    public static let testPluginNameNoPlugin = "Not a Plugin Name"
    public static let testPluginDirectory = "\(testPluginName).\(testPluginFileExtension)"
    public static let testPluginDirectoryTwo = "\(testPluginNameTwo).\(testPluginFileExtension)"
    public static let testPluginDirectoryOtherDirectory = "\(testPluginNameTestNode).\(testPluginFileExtension)"
    public static let testPluginOptionsEnabledName = testPluginNameHelloWorld
    public static let testPluginOptionsDisabledName = testPluginNameTestLog
    public static let testPluginOptionsNilName = testPluginNamePrint

    // Plugins

    public class func pathForPlugin(withName name: String) -> String? {
        return urlForPlugin(withName: name)?.path
    }

    public class func urlForPlugin(withName name: String) -> URL? {
        for directoryURL in testPluginsDirectoryURLs {
            let pluginURL = directoryURL
                .appendingPathComponent(name)
                .appendingPathExtension(testPluginFileExtension)
            var isDir: ObjCBool = false
            guard
                FileManager.default.fileExists(atPath: pluginURL.path,
                                               isDirectory: &isDir),
                isDir.boolValue
            else {
                continue
            }
            return pluginURL
        }

        return nil
    }

    // Outside Plugin

    public static var testOutsidePluginURL: URL {
        let baseURL = Bundle(for: TestPlugins.self).url(forResource: testPluginNameOutsidePathComponent,
                                                        withExtension: nil)!
        return baseURL.appendingPathComponent(testPluginNameOutside).appendingPathExtension(testPluginFileExtension)
    }

    public static var testOutsidePluginPath: String {
        return testOutsidePluginURL.path
    }

    // Directories

    public static var testBuiltInPluginsDirectoryURL: URL {
        guard let url = pluginsDirectoryURL(forPathComponent: packagesPathComponentRuby) else {
            assertionFailure()
            return URL(string: "")!
        }
        return url
    }

    public static var testBuiltInPluginsDirectoryPath: String {
        return testBuiltInPluginsDirectoryURL.path
    }

    public static var testPluginsDirectoryURLs: [URL] {
        let urls = packagesPathComponents.compactMap { pluginsDirectoryURL(forPathComponent: $0) }
        assert(urls.count == packagesPathComponents.count)
        return urls
    }

    public static var testPluginsDirectoryPaths: [String] {
        return testPluginsDirectoryURLs.map { $0.path }
    }

    // MARK: Private

    static let testPluginNames = [
        testPluginNameCat,
        testPluginNameEcho,
        testPluginNameHelloWorld,
        testPluginNameInvalid,
        testPluginNamePrint,
        testPluginNameTestEnvironment,
        testPluginNameTestFileExtension,
        testPluginNameTestLog,
        testPluginNameTestPromptInterrupt,
        testPluginNameTestServer,
        testPluginNameTestNode
    ]

    // Helper

    private class func pluginsDirectoryURL(forPathComponent pathComponent: String) -> URL? {
        guard let url = Bundle(for: TestPlugins.self).url(forResource: pathComponent, withExtension: nil) else {
            assertionFailure()
            return nil
        }
        return url
    }

    private class func isTestPluginName(_ name: String) -> Bool {
        return testPluginNames.contains(name)
    }
}
