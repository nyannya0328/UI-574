//
//  MainView.swift
//  UI-574
//
//  Created by nyannyan0328 on 2022/05/31.
//

import SwiftUI

struct MainView: View {
    @StateObject var model : AppViewModel = .init()
    @Namespace var animation
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection: $model.currentTab) {
            
          Home(animation: animation)
                .environmentObject(model)
                .setUp()
                .tag(Tab.home)
            
            Text("B")
                .setUp()
                .tag(Tab.cart)
            
            Text("C")
                .setUp()
                .tag(Tab.star)
            
            Text("D")
                .setUp()
                .tag(Tab.person)
            
            
        
            
            
        }
        .overlay(alignment: .bottom) {
            
            CustomTab(currenTab: $model.currentTab, animation: animation)
            
            
        }
        
        .overlay {
            
            if let funiture = model.currentActiveItem,model.showDetail{
                
            DetailView(funiture: funiture, animation: animation)
                    .environmentObject(model)
                    .transition(.offset(x: 1, y: 1))
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func setUp()->some View{
        
        
        self
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .background{
               
                  Color("BG").ignoresSafeArea()
              }
    }
    
    func getSafeArea()->UIEdgeInsets{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            
            return .zero
        }
        return safeArea
    }
}
