//
//  ProductDetailVM.swift
//  NihilentHarishTest
//
//  Created by BrainAbove on 09/01/23.
//

import Foundation

final class ProductDetailVM {
    // MARK: - Instance Property
    var product: Product?
    var products: [Product] {
        get {
            return DataManager.shared.products
        }
        set {
            DataManager.shared.products = newValue
        }
    }
    
    var eventHandler: ((_ event: Event) -> Void)?
    
    func updateFavourite(_ index: Int) {
        if  index == products.firstIndex(where: { $0.id ?? "" == product?.id ?? "" }) {
            let status: Bool = products[index].isInWishlist ?? false
            products[index].isInWishlist = !status
            product?.isInWishlist = !status
            self.eventHandler?(.dataLoaded)
        }
    }
    
}

extension ProductDetailVM {
    
    enum Event {
        case dataLoaded
        case error(Error?)
    }
    
}
