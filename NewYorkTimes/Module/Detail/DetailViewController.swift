//
//  DetailViewController.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 5.06.2024.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
    
    func setTitle(_ title: String)
    func setNewsTitle(_ title: String)
    func setNewsAuthor(_ author: String)
    func setAbstract(_ abstract: String)
    func setNewsImage(_ image: UIImage)
    func getSource() -> News?
}

final class DetailViewController: BaseViewController {

    @IBOutlet weak var newsAbstract: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var presenter: DetailPresenterProtocol!
    var source: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }

    @IBAction func showMoreAction(_ sender: UIButton) {
        
        presenter.seeMoreButtonTapped()
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func setNewsTitle(_ title: String) {
        self.newsTitle.text = title
    }
    
    func setNewsAuthor(_ author: String) {
        self.newsAuthor.text = author
    }
    
    func setAbstract(_ abstract: String) {
        self.newsAbstract.text = abstract
    }
    
    func setNewsImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    func getSource() -> News? {
        return source
    }
    
}
