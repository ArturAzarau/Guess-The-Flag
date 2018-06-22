//
//  FlagButton.swift
//  Guess The Flag
//
//  Created by Артур Азаров on 22.06.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit

final class FlagButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
