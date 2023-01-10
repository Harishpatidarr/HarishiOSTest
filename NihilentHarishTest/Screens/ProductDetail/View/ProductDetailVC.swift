//
//  ProductDetailVC.swift
//  NihilentHarishTest
//
//  Created by BrainAbove on 09/01/23.
//

import UIKit

class ProductDetailVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!

    
    // MARK: - Variables
    
    var viewModel = ProductDetailVM()
    
    // MARK: - UIViewController Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        observeEvent()

    }
    
    // MARK: - Custom button Action
    @IBAction func addRemoveFavoriteButtonTapped(_ sender: UIButton) {
        viewModel.updateFavourite(sender.tag)
    }
    
    // Data binding  - communication
    private func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }

            switch event {
            case .dataLoaded:
                print("Data loaded...")
                DispatchQueue.main.async {
                    // UI Main works well
                    self.configuration()
                }
            case .error(let error):
                print(error)
            }
        }
    }
}

// MARK: - Private Funcation

extension ProductDetailVC {
    
    private func configuration() {
        productImageView.setImage(with: viewModel.product?.imageURL ?? "")
        productTitleLabel.text = viewModel.product?.title
        priceLabel.text = "$\(String(describing: viewModel.product?.price?.first?.value ?? 0))"
        rateButton.setTitle("\(String(describing: viewModel.product?.ratingCount ?? 0))", for: .normal)
        if viewModel.product?.isInWishlist ?? false {
            favouriteButton.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
        } else {
            favouriteButton.setImage(UIImage.init(systemName: "heart"), for: .normal)
        }
    }
}

