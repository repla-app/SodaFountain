//
//  PotionTaster.swift
//  PotionTaster
//
//  Created by Roben Kleene on 5/25/17.
//  Copyright © 2017 Roben Kleene. All rights reserved.
//

import Foundation

public class PotionTaster {

    public static let testPluginFileExtension = "wcplugin"
    public static let testPluginName = "HTML"
    public static let testPluginNameTwo = "IRB"
    public static let testPluginNameSharedTestResources = "Shared-Test-Resources"
    public static let testPluginNameNoPlugin = "Not a Plugin Name"
    public static let testPluginCommand = "html.rb"
    public static let testPluginCommandTwo = "irb.rb"
    public static let testPluginDirectoryName = "\(testPluginName).\(testPluginFileExtension)"
    public static let testPluginDirectoryNameTwo = "\(testPluginNameTwo).\(testPluginFileExtension)"
    public static let testPluginNames = [testPluginName, testPluginNameTwo, testPluginNameSharedTestResources]
    public static let testPluginDirectoryNames = testPluginNames.map { "\($0).\(testPluginFileExtension)" }

    // Note that this returns a symlink path
    public static var pluginsDirectoryPath: String {
        return pluginsDirectoryURL.path
    }
    public static var pluginsDirectoryURL: URL {
        return Bundle(for: PotionTaster.self).builtInPlugInsURL!.resolvingSymlinksInPath()
    }
    public class func pathForPlugin(withName name: String) -> String? {
        return urlForPlugin(withName: name)?.path
    }
    public class func urlForPlugin(withName name: String) -> URL? {
        let pluginURL = pluginsDirectoryURL
            .appendingPathComponent(name)
            .appendingPathExtension(testPluginFileExtension)
        var isDir: ObjCBool = false
        guard
            FileManager.default.fileExists(atPath: pluginURL.path,
                                           isDirectory: &isDir),
            isDir.boolValue else
        {
            return nil
        }
        return pluginURL
    }
}
