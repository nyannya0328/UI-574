//
//  AppViewModel.swift
//  UI-574
//
//  Created by nyannyan0328 on 2022/05/31.
//

import SwiftUI

class AppViewModel: ObservableObject {
    @Published var currentTab : Tab = .home
    @Published var menuTitle : String = "All"
    
    @Published var showDetail : Bool = false
    @Published var currentActiveItem : Funiture?
    
   
}

