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
    public var testHTMLJQUERY: File {
        return File(url: URL(string: "")!, path: "")
    }

    // MARK: Private

    func url(forResource name: String,
             withExtension extension: String,
             subdirectory: String) -> URL {
        return URL(string: "")!
        
    }

}
