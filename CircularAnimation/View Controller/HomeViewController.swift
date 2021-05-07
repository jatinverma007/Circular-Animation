//
//  ViewController.swift
//  CircularAnimation
//
//  Created by jatin verma on 07/05/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var sampleImages = ["1", "2", "3", "4", "5", "6"]
       var circle = CircleAnimation(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
       override func viewDidLoad() {
           super.viewDidLoad()
        collectionView.register(UINib(nibName: "CAHomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CAHomeCollectionViewCell")
       }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CAHomeCollectionViewCell", for: indexPath) as! CAHomeCollectionViewCell
        cell.url = sampleImages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 128)
    }

}

