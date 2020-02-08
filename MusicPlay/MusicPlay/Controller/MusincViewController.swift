//
//  MusincViewController.swift
//  prog5
//
//  Created by 曲波 on 2019/12/08.
//  Copyright © 2019 曲波. All rights reserved.
//

import UIKit

class MusincViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var fileData: FileRoot? {
        didSet{
            collectionView?.reloadSections([2])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "albums", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                fileData = try decoder.decode(FileRoot.self, from: data)
            } catch {
                fatalError()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushAlbum" {
            guard let destination = segue.destination as? AlbumVC else { return }
            guard let album = sender as? Album else { return }
            
            destination.album = album
        }
    }
}

// MARK: - Navigation
extension MusincViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 4
        }
        else {
            return 12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "promotionCell", for: indexPath)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath)
            
            if let cells = cell as? ButtonCell,
                let cellType = ButtonCell.ButtonType(rawValue: indexPath.row) {
                cells.type = cellType
            }
            return cell
        }
        else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! AlbumCell
            if let data = fileData?.albums[indexPath.row] {
                cell.image.image = UIImage(named: data.cover)
                cell.label.text = data.name
            }
            return cell
        }
        else {
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 2:
            if let data = fileData?.albums[indexPath.row] {
                performSegue(withIdentifier: "pushAlbum", sender: data)
            }
        default:
            break
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
}
extension MusincViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width
        switch indexPath.section {
        case 0:
            let ratio = CGFloat(170) / CGFloat(740)
            return CGSize(width: screenWidth, height: screenWidth * ratio)
        case 1:
            let width = (screenWidth - 30.0) / 4.0
            return CGSize(width: width, height: width)
        case 2:
            let width = (screenWidth - 21.0) / 3.0
            return CGSize(width: width, height: width)
        default:
            fatalError()
        }
    }
}
