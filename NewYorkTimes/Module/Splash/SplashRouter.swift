//
//  SplashRouter.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 30.05.2024.
//

import Foundation

enum SplashRoutes {
    case home
}

protocol SplashRouterProtocol {
    func navigate(_ route: SplashRoutes)
}

final class SplashRouter {
    
    weak var viewController: SplashViewController?
    
    static func createModule() -> SplashViewController {
        let view = SplashViewController()
        let interactor = SplashInteractor()
        let router = SplashRouter()
        let presenter = SplashPresenter(
            view: view,
            router: router,
            interactor: interactor
        )
        
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
        
    }
}

extension SplashRouter: SplashRouterProtocol {
    
    func navigate(_ route: SplashRoutes) {
        switch route {
        case .home:
            print("You have reached to home page!")
            break
        }
    }
}
