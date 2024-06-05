//
//  DetailPresenter.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 5.06.2024.
//

import UIKit

extension DetailPresenter {
    fileprivate enum Constants {
        static let pageTitle: String = "Detail"
    }
}

protocol DetailPresenterProtocol {
    func viewDidLoad()
    func seeMoreButtonTapped()
}

final class DetailPresenter {
    
    unowned var view: DetailViewControllerProtocol?
    let router: DetailRouterProtocol
    
    init(
        view: DetailViewControllerProtocol? = nil,
        router: DetailRouterProtocol
    ) {
        self.view = view
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    
    func viewDidLoad() {
        
        guard let news = view?.getSource() else { return }
        
        view?.setTitle(Constants.pageTitle)
        view?.setNewsTitle(news.title ?? "")
        view?.setAbstract(news.abstract ?? "")
        view?.setNewsAuthor(news.byline ?? "")
        DispatchQueue.main.async {
            ImageDownloader.shared.image(news: news, format: .superJumbo) { [weak self] data , error in
                guard let self else { return }
                if let data {
                    guard let image = UIImage(data: data) else { return }
                    view?.setNewsImage(image)
                }
            }
        }
    }
    
    func seeMoreButtonTapped() {
        guard let urlString = view?.getSource()?.url else { return }
        guard let url = URL(string: urlString) else { return }
        router.navigate(.openURL(url: url))
    }
    
    
}
