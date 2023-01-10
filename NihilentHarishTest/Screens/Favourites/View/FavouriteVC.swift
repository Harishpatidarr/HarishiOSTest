//
//  FavouriteVC.swift
//  NihilentHarishTest
//
//  Created by BrainAbove on 10/01/23.
//

import UIKit

class FavouriteVC: UIViewController {
    // MARK: - Outlets
       
       @IBOutlet weak var productTableView: UITableView!
       
       // MARK: - Variables
       
       var viewModel = FavouriteVM()
       
       
       // MARK: - UIViewController Life Cycle Methods
       
    override func viewDidLoad() {
           super.viewDidLoad()
        configuration()
       }
    
    override func viewWillAppear(_ animated: Bool) {
        self.productTableView.reloadData()
    }

}
// MARK: - Private Funcation

extension FavouriteVC {

   private func configuration() {
       
        productTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        observeEvent()
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
                    self.productTableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }

    @objc func addRemoveFavoriteProduct(_ sender: UIButton) {
        viewModel.updateFavourite(index: sender.tag)
    }
}

extension FavouriteVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.favProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell else {
            return UITableViewCell()
        }
        let product = viewModel.favProducts[indexPath.row]
        cell.product = product
        cell.favouriteButton.tag = indexPath.row
        cell.favouriteButton.addTarget(self, action: #selector(addRemoveFavoriteProduct(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = viewModel.favProducts[indexPath.row]
        let viewController = Storyboard.main.instantiate(vcType: ProductDetailVC.self)
        viewController.viewModel.product = product
        self.present(viewController, animated: true)
    }
    
}
