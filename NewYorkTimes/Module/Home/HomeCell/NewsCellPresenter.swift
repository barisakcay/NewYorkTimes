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
        //TODO: ImageLoad
        view?.setTitleLabel(news.title ?? "")
        view?.setAuthorLabel(news.byline ?? "")
    }
}
