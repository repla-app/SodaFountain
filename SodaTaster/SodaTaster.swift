//
//  SodaTaster.swift
//  SodaTaster
//
//  Created by Roben Kleene on 5/25/17.
//  Copyright © 2017 Roben Kleene. All rights reserved.
//

import Foundation

public class SodaTaster {
    // Public

    // Plugins
    public static let testPluginNameHTML = "HTML"
    public static let testPluginCommandHTML = "html.rb"
    public static let testPluginNameIRB = "IRB"
    public static let testPluginCommandIRB = "irb.rb"
    public static let testPluginNameSharedTestResources = "SharedTestResources"
    public static let testPluginNameSharedResources = "SharedResources"
    public static let testPluginNameCat = "Cat"
    public static let testPluginNameHelloWorld = "HelloWorld"
    public static let testPluginNameInvalid = "Invalid"
    public static let testPluginNamePrint = "Print"
    public static let testPluginNameTestEnvironment = "TestEnvironment"
    public static let testPluginNameTestLog = "TestLog"

    // Special
    public static let testPluginNameNonexistent = "Nonexistent"

    // Metadata
    public static let testPluginFileExtension = "wcplugin"

    // Collections
    static let testRootPluginDirectoryNames = testRootPluginNames.map { "\($0).\(testPluginFileExtension)" }
    static let testSharedTestResourcesPluginDirectoryNames = testRootPluginNames.map {
        "\($0).\(testPluginFileExtension)"
    }
    public static let testPluginNames = testRootPluginNames + testSharedTestResourcesPluginNames
    public static let testPluginDirectoryNames = testRootPluginDirectoryNames
        + testSharedTestResourcesPluginDirectoryNames

    // Generic
    public static let testPluginName = testPluginNameHTML
    public static let testPluginNameTwo = testPluginNameIRB
    public static let testPluginCommand = testPluginCommandHTML
    public static let testPluginCommandTwo = testPluginCommandIRB
    public static let testPluginNameNoPlugin = "Not a Plugin Name"
    public static let testPluginDirectoryName = "\(testPluginName).\(testPluginFileExtension)"
    public static let testPluginDirectoryNameTwo = "\(testPluginNameTwo).\(testPluginFileExtension)"

    // Private
    static let testRootPluginNames = [
        testPluginNameHTML,
        testPluginNameIRB,
        testPluginNameSharedTestResources,
        testPluginNameSharedResources
    ]
    static let testSharedTestResourcesPluginNames = [
        testPluginNameCat,
        testPluginNameHelloWorld,
        testPluginNameInvalid,
        testPluginNamePrint,
        testPluginNameTestEnvironment,
        testPluginNameTestLog
    ]
    static let pluginResourcesPathComponent = "Contents/Resources"
    static let rootPluginsPathComponent = "Bundles"
    static let sharedTestResourcesPluginDirectory = "plugin"

    // Directories

    public static var rootPluginsDirectoryPath: String {
        return rootPluginsDirectoryURL.path
    }
    public static var rootPluginsDirectoryURL: URL {
        return Bundle(for: SodaTaster.self).url(forResource: rootPluginsPathComponent,
                                                  withExtension: nil)!
    }

    // Shared Test Resources Directories

    public static var sharedTestResourcesPluginsDirectoryURL: URL {
        let pluginURL = SodaTaster.urlForPlugin(withName: SodaTaster.testPluginNameSharedTestResources)!
        return pluginURL
            .appendingPathComponent(pluginResourcesPathComponent)
            .appendingPathComponent(sharedTestResourcesPluginDirectory)
    }
    public static var sharedTestResourcesPluginsDirectoryPath: String {
        return sharedTestResourcesPluginsDirectoryURL.path
    }

    // Plugins

    public class func pathForPlugin(withName name: String) -> String? {
        return urlForPlugin(withName: name)?.path
    }
    public class func urlForPlugin(withName name: String) -> URL? {
        let pluginsDirectoryURL = isSharedTestResourcesPluginName(name) ? sharedTestResourcesPluginsDirectoryURL
            : rootPluginsDirectoryURL
        let pluginURL = pluginsDirectoryURL
            .appendingPathComponent(name)
            .appendingPathExtension(testPluginFileExtension)
        var isDir: ObjCBool = false

        guard
            FileManager.default.fileExists(atPath: pluginURL.path,
                                           isDirectory: &isDir),
            isDir.boolValue else {
            return nil
        }
        return pluginURL
    }

    // Helper

    private class func isSharedTestResourcesPluginName(_ name: String) -> Bool {
        return testSharedTestResourcesPluginNames.contains(name)
    }
}
