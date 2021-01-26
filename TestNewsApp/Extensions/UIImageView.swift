//
//  UIImageView.swift
//  TestNewsApp
//
//  Created by Balnur Sakhybekova on 1/26/21.
//  Copyright © 2021 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFromUrl(_ path: String) {
        guard let imageURL = URL(string: path) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
}
