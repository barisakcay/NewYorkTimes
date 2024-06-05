//
//  NewsCellPresenter.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 4.06.2024.
//

import Foundation
import UIKit

protocol NewsCellPresenterProtocol {
    func load()
}

final class NewsCellPresenter {
    
    weak var view: NewsCellProtocol?
    private let news: News
    
    init(
        view: NewsCellProtocol? = nil,
        news: News
    ) {
        self.view = view
        self.news = news
    }
}

extension NewsCellPresenter: NewsCellPresenterProtocol {
    
    func load() {
        DispatchQueue.main.async {
            ImageDownloader.shared.image(news: self.news, format: .threeByTwoSmallAt2X) { [weak self] data, error in
                guard let self else { return }
                if let data {
                    guard let image = UIImage(data: data) else { return }
                    self.view?.setImage(image)
                }
            }
        }
        view?.setTitleLabel(news.title ?? "")
        view?.setAuthorLabel(news.byline ?? "")
    }
}
