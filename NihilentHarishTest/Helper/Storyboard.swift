//
//  Storyboard.swift
//  GoodGuysHomeServices
//
//  Created by Harish Patidar on 23/05/19.
//  Copyright © 2019 Brain Above. All rights reserved.
//

import UIKit

enum Storyboard: String {
    
    case main = "Main"

    func instance() -> UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    func instantiate<VC: UIViewController>(vcType: VC.Type) -> VC {
        return instance().instantiateViewController(withIdentifier: String(describing: vcType.self)) as! VC
    }
}


