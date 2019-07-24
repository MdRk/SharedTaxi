//
//  HomeVC.swift
//  SharedTaxi
//
//  Created by 前田陸 on 2019/07/22.
//  Copyright © 2019 陸　前田. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var roomCollectionView: UICollectionView!
    
    var nextVCTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        roomCollectionView.delegate = self
        roomCollectionView.dataSource = self
        roomCollectionView.register(UINib(nibName: "RoomCVCell", bundle: nil), forCellWithReuseIdentifier: "roomCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: roomCollectionView.bounds.width*0.4, height: roomCollectionView.bounds.width*0.4)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
        roomCollectionView.collectionViewLayout = layout
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "toChat":
            let nextVC = segue.destination as! ChatVC
            nextVC.navigationItem.title = nextVCTitle
            break
        default:
            break
        }
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nextVCTitle = "ルーム\(indexPath.row+1)"
        
        performSegue(withIdentifier: "toChat", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = roomCollectionView.dequeueReusableCell(withReuseIdentifier: "roomCell", for: indexPath)
        
        return cell
    }
}
