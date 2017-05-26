//
//  PotionTaster.swift
//  PotionTaster
//
//  Created by Roben Kleene on 5/25/17.
//  Copyright © 2017 Roben Kleene. All rights reserved.
//

import Foundation

enum PotionTaster {
    static var pluginsDirectoryPath: String {
        return Bundle.main.builtInPlugInsPath!
    }
    static var pluginsDirectoryURL: URL {
        return Bundle.main.builtInPlugInsURL!
    }
}
