//
//  Prodcut.swift
//  NihilentHarishTest
//
//  Created by BrainAbove on 09/01/23.
//

import Foundation

// MARK: - Products
struct ProductsData: Codable {
    let products: [Product]?
}

// MARK: - Product
struct Product: Codable {
    let citrusId: String?
    let title, id: String?
    let imageURL: String?
    let price: [Price]?
    let brand: String?
    let badges: [String]?
    let ratingCount: Double?
    let messages: Messages
    let isAddToCartEnable: Bool?
    var isInTrolley, isInWishlist: Bool?
    let purchaseTypes: [PurchaseTypeElement]
    let isFindMeEnable: Bool?
    let saleUnitPrice: Double?
    let totalReviewCount: Int?
    let isDeliveryOnly, isDirectFromSupplier: Bool?
}

// MARK: - Messages
struct Messages: Codable {
    let secondaryMessage: String?
    let promotionalMessage: String?
}

// MARK: - Price
struct Price: Codable {
    //let message: Message?
    let value: Double?
    let isOfferPrice: Bool?
}

// MARK: - PurchaseTypeElement
struct PurchaseTypeElement: Codable {
    let purchaseType: PurchaseTypeEnum
    let displayName: DisplayName
    let unitPrice: Double
    let minQtyLimit, maxQtyLimit, cartQty: Int
}

enum DisplayName: String, Codable {
    case case6 = "case (6)"
    case each = "each"
    case perBottle = "per bottle"
    case perCaseOf6 = "per case of 6"
}

enum PurchaseTypeEnum: String, Codable {
    case bottle = "Bottle"
    case purchaseTypeCase = "Case"
}
