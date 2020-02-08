//
//  AlbumVC.swift
//  MusicPlay
//
//  Created by 曲波 on 2020/01/12.
//  Copyright © 2020 曲波. All rights reserved.
//

import UIKit

class AlbumVC: UITableViewController {
    var album: Album!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var publishLbael: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = album.name
        artistLabel.text = album.artist
        publishLbael.text = album.publish
        image.image = UIImage(named: album.cover)
    }
}

//extension AlbumVC: UITableViewDataSource, UITableViewDelegate {
//    
//}
