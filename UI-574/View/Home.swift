//
//  Home.swift
//  UI-574
//
//  Created by nyannyan0328 on 2022/05/31.
//

import SwiftUI

struct Home: View {
    var animation : Namespace.ID
    @EnvironmentObject var model : AppViewModel

    let black : Color = Color("Black")
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack(spacing:20){
                
                
                VStack(alignment: .leading, spacing: 13) {
                    
                    
                    Text("Best Furniture")
                        .font(.title.weight(.bold))
                        .foregroundColor(.black)
                    
                    
                    Text("Perfect Choice")
                        .font(.footnote.weight(.light))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                
                HStack(spacing:15){
                    
                    
                    HStack{
                        
                        Image("Search")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                            .foregroundColor(black)
                        
                        
                        TextField("", text: .constant(""))
                           
                    }
                    .padding(.vertical,15)
                    .padding(.horizontal,10)
                    .background{
                     
                     
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.white)
                        
                    }
                    
                    
                    Button {
                        
                    } label: {
                        
                        Image("Filter")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                            .foregroundColor(black)
                    }
                    .padding(.vertical,15)
                    .padding(.horizontal,10)
                    .background{
                     
                     
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.white)
                        
                    }

                }
                
                
                
             //   CustomMenu()
                
                ForEach(furnitures){funiture in
                   CardView(funiture: funiture)
                    
                    
                }
                
                
                
            }
            .padding()
        }
        .padding(.bottom,100)
    }
    @ViewBuilder
    func CardView(funiture : Funiture)->some View{
        
        HStack{
            
            
            Group{
                
                if model.currentActiveItem?.id == funiture.id && model.showDetail{
                    
                    
                    Image(funiture.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                }
                else{
                    
                    Image(funiture.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: funiture.id + "Image", in: animation)
                    
                    
                }
                
            }
            .frame(width: 150)
            .background{
             
                
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color("CardBG"))
            }
            
            VStack(alignment: .leading, spacing: 14) {
                
                Group{
                    
                    if model.currentActiveItem?.id == funiture.id && model.showDetail{
                        
                        
                        Text(funiture.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .opacity(0)
                        
                        
                        Text("By Seto")
                            .font(.callout.weight(.light))
                            .foregroundColor(.black)
                            .opacity(0)
                    }
                    
                    else{
                        
                        
                        Text(funiture.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: funiture.id + "TITLE", in: animation)
                        
                        
                        Text("By Seto")
                            .font(.callout.weight(.light))
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: funiture.id + "BYSETO", in: animation)
                        
                        
                    }
                }
                
                
                Text(funiture.subTitle)
                    .font(.caption.weight(.semibold))
                    .lineLimit(1)
                
                
                HStack{
                    
                    Text(funiture.price)
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                    
                    Button {
                        
                    } label: {
                        
                        Text("BUY")
                            .font(.title3.weight(.black))
                            .foregroundColor(.white)
                            .padding(.vertical,13)
                            .padding(.horizontal)
                            .background{
                             
                                RoundedRectangle(cornerRadius: 40, style: .continuous)
                                    .fill(Color("Orange"))
                            }
                    }
                    .scaleEffect(0.9)

                }
                .padding(.vertical,12)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .topLeading)
            
        }
        .padding(10)
        .background{
         
            
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
                .shadow(color: black.opacity(0.2), radius: 5, x: 5, y: 5)
        }
        .onTapGesture {
            
            withAnimation(.easeInOut){
                
                model.currentActiveItem = funiture
                model.showDetail =  true
            }
        }
        
        
    }
//    @ViewBuilder
//   func CustomMenu()->some View{
//
//       HStack(spacing:13){
//
//
//           ForEach(["All","Chair","Table","Lamp","Floor"],id:\.self){title in
//
//               Text(title)
//                   .font(.title3.weight(.ultraLight))
//                   .frame(maxWidth: .infinity,alignment: .center)
//                   .foregroundColor(model.menuTitle == title ? .white : .black)
//                   .padding(.vertical,10)
//                   .padding(.horizontal,10)
//                   .background{
//
//
//                       if model.menuTitle == title{
//
//                           Capsule()
//                               .fill(black)
//                               .shadow(color: black.opacity(0.2), radius: 5, x: 5, y: 5)
//                               .matchedGeometryEffect(id: "MENU", in: animation)
//
//
//                       }
//
//
//                   }
//                   .contentShape(Capsule())
//                   .onTapGesture {
//
//                       withAnimation(.easeOut){
//
//                           model.menuTitle = title
//                       }
//                   }
//
//
//
//           }
//       }
//
//    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
