//
//  AlbumCellCollectionViewController.swift
//  MusicPlay
//
//  Created by 曲波 on 2019/12/21.
//  Copyright © 2019 曲波. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    enum PhotoType: Int {
        case cover1
        case cover2
        case cover3
        case cover4
        case cover5
        case cover6
        case cover7
    }
}
