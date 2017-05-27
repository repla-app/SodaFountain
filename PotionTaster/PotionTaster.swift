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
    public static let testPluginNameNoPlugin = "Not a Plugin Name"
    public static let testPluginCommand = "html.rb"
    public static let testPluginCommandTwo = "irb.rb"
    public static let testPluginDirectoryName = "\(testPluginName).\(testPluginFileExtension)"
    public static let testPluginDirectoryNameTwo = "\(testPluginNameTwo).\(testPluginFileExtension)"
    public static let testPluginDirectoryNames = [testPluginDirectoryName, testPluginDirectoryNameTwo]

    // Note that this returns a symlink path
    public static var pluginsDirectoryPath: String {
        return pluginsDirectoryURL.path
    }
    public static var pluginsDirectoryURL: URL {
        return Bundle(for: PotionTaster.self).builtInPlugInsURL!.resolvingSymlinksInPath()
    }
    public class func pathForPlugin(withName: String) -> String? {
        return nil
    }
    public class func urlForPlugin(withName: String) -> URL? {
        return nil
    }
}
