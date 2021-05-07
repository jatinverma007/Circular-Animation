//
//  CAHomeCollectionViewCell.swift
//  CircularAnimation
//
//  Created by jatin verma on 07/05/21.
//

import UIKit


class CAHomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: CircleAnimation!
    @IBOutlet weak var userImageView: UIImageView!
    
    
    var url:String! {
        didSet {
            userImageView.image = UIImage(named: url)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = containerView.bounds.height / 2
        containerView.clipsToBounds = true
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2
        userImageView.clipsToBounds = true
        setupGesture()
    }
    
    func setupGesture() {
        let imagetap = UITapGestureRecognizer(target: self, action: #selector(self.imageTappedGesture(_:)))
        userImageView.addGestureRecognizer(imagetap)
        userImageView.isUserInteractionEnabled = true
    }
    
    @objc func imageTappedGesture(_ sender: UITapGestureRecognizer) {
        containerView.animateSpinner()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            self.containerView.removeAnimation()
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

}
