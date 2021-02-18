//
//  AssetSource.swift
//  SodaFountain
//
//  Created by Roben Kleene on 2/17/19.
//  Copyright © 2019 Roben Kleene. All rights reserved.
//

import Foundation

public protocol AssetSourceType {
    static var assetPathComponentData: String { get }
    static var packagesPathComponentData: String { get }
    static var packagesPathComponents: [String] { get }
}

public class AssetSource: AssetSourceType {
    public static let assetPathComponentData = "Assets/repla-test-data/"
    public static let packagesPathComponentData = assetPathComponentData + "packages"
    public static let packagesPathComponents = [packagesPathComponentData]
}
