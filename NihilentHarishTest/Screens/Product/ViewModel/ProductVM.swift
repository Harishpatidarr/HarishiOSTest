//
//  ProductVM.swift
//  NihilentHarishTest
//
//  Created by BrainAbove on 09/01/23.
//

import Foundation

final class ProductVM {
    
    // MARK: - Instance Property
    
    var products: [Product] {
        get {
            return DataManager.shared.products
        }
        set {
            DataManager.shared.products = newValue
        }
    }
    var eventHandler: ((_ event: Event) -> Void)?
}

// MARK: Api Calling Method

extension ProductVM {
    
    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                DataManager.shared.products = products
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func updateFavourite(index: Int) {
        let status: Bool = products[index].isInWishlist ?? false
        products[index].isInWishlist = !status
        self.eventHandler?(.dataLoaded)
    }
}


extension ProductVM {
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
    
}
