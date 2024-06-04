//
//  HomeRouter.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 31.05.2024.
//

import Foundation

enum HomeRoutes {
    case detail//(source: News?)
}

protocol HomeRouterProtocol {
    func navigate(_ route: HomeRoutes)
}

final class HomeRouter {
    
    weak var viewController: HomeViewController?
    
    static func createModule() -> HomeViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}

extension HomeRouter: HomeRouterProtocol {
    
    func navigate(_ route: HomeRoutes) {
        
    }
}
