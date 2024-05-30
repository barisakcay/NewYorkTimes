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
    
}

extension SplashRouter: SplashRouterProtocol {
    
    func navigate(_ route: SplashRoutes) {
        switch route {
        case .home:
            break
        }
    }
}
