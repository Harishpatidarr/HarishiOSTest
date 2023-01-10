//
//  FavouriteVM.swift
//  NihilentHarishTest
//
//  Created by BrainAbove on 10/01/23.
//

import Foundation

final class FavouriteVM {
    
    // MARK: - Instance Property
    
    var products: [Product] {
        get {
            return DataManager.shared.products
        }
        set {
            DataManager.shared.products = newValue
        }
    }
    
    var favProducts: [Product] {
        return products.filter({ $0.isInWishlist == true})
    }
    
    var eventHandler: ((_ event: Event) -> Void)?
    
    func updateFavourite(index: Int) {
        if let newIndex = products.firstIndex(where: { $0.id ?? "" == favProducts[index].id ?? ""}) {
            let status: Bool = products[newIndex].isInWishlist ?? false
            products[newIndex].isInWishlist = !status
            self.eventHandler?(.dataLoaded)
        }
    }
}
extension FavouriteVM {
    
    enum Event {
        case dataLoaded
        case error(Error?)
    }
    
}
