//
//  NewsCell.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 1.06.2024.
//

import UIKit

protocol NewsCellProtocol: AnyObject {
    func setImage(_ image: UIImage)
    func setTitleLabel(_ title: String)
    func setAuthorLabel(_ author: String)
}

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    
    var cellPresenter: NewsCellPresenterProtocol! {
        didSet {
            cellPresenter.load()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension NewsCell: NewsCellProtocol {
    
    func setImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.newsImage.image = image
        }
    }
    
    func setTitleLabel(_ title: String) {
        self.newsTitle.text = title
    }
    
    func setAuthorLabel(_ author: String) {
        self.newsAuthor.text = author
    }
}
