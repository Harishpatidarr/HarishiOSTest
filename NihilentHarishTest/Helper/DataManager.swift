//
//  DataManager.swift
//  NihilentHarishTest
//
//  Created by BrainAbove on 10/01/23.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    private init() {}
    var products: [Product] = []
}
