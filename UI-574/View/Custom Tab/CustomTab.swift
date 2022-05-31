//
//  CustomTab.swift
//  UI-574
//
//  Created by nyannyan0328 on 2022/05/31.
//

import SwiftUI

struct CustomTab: View {
    @Binding var currenTab : Tab
    var animation : Namespace.ID
    @State var currentXValue : CGFloat = 0
    
    let black : Color = Color("Black")
    var body: some View {
        HStack(spacing:0){
            
            ForEach(Tab.allCases,id:\.rawValue){tab in
                
                
                TabCardView(tab: tab)
                    .overlay {
                        
                        Text(tab.rawValue)
                            .font(.title3.weight(.light))
                            .foregroundColor(black)
                            .offset(y: currenTab == tab ? 25 : 100)
                    }
                
            }
        }
        .padding(.bottom,getSafeArea().bottom == 0 ? 15 : 0)
        .background{
         
            Color.white
                .shadow(color:black, radius: 5, x: 5, y: 5)
                .clipShape(BottomShape(currentXValue: currentXValue))
                .ignoresSafeArea(.container, edges: .bottom)
        }
    }
    @ViewBuilder
    func TabCardView(tab : Tab)->some View{
        
        GeometryReader{proxy in
            
            Button {
                
                withAnimation{
                    
                    currenTab = tab
                    currentXValue = proxy.frame(in: .global).midX
                }
                
            } label: {
                
                
                Image(tab.rawValue)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity,alignment: .center)
                    .padding(currenTab == tab ? 20 : 0)
                    .background{
                     
                        
                        if currenTab == tab{
                            
                            Circle()
                                .fill(Color("Orange"))
                                .shadow(color:black, radius: 5, x: 5, y: 5)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Rectangle())
                    .offset(y: currenTab == tab ? -60 : 0)
                    
            }
            .onAppear {
                
                if tab == Tab.allCases.first && currentXValue == 0{
                    
                    
                    currentXValue = proxy.frame(in: .global).midX
                }
            }
        }
        .frame(height: 35)

    }
}

struct CustomTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Tab : String,CaseIterable{
    
    case home = "Home"
    case cart = "Cart"
    case star = "Star"
    case person = "Profile"
}
