//
//  ProductCell.swift
//  NihilentHarishTest
//
//  Created by BrainAbove on 09/01/23.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!

    var product: Product? {
        didSet { 
            productDetailConfiguration()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func productDetailConfiguration() {
        guard let product else { return }
        productTitleLabel.text = product.title
        priceLabel.text = "$\(String(describing: product.price?.first?.value ?? 0))"
        rateButton.setTitle("\(String(describing: product.ratingCount ?? 0))", for: .normal)
        productImageView.setImage(with: product.imageURL ?? "")
        if product.isInWishlist! {
            favouriteButton.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
        } else {
            favouriteButton.setImage(UIImage.init(systemName: "heart"), for: .normal)
        }
        
    }
    
}
