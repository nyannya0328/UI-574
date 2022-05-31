//
//  DetailView.swift
//  UI-574
//
//  Created by nyannyan0328 on 2022/05/31.
//

import SwiftUI

struct DetailView: View {
    
    var funiture : Funiture
    var animation : Namespace.ID
    @EnvironmentObject var model : AppViewModel
    
    @State var showDetailContent : Bool = false
    
    @State var activeColor : String = "Color1"
    
    @State var count : Int = 0

    let black : Color = Color("Black")
    var body: some View {
        GeometryReader{proxy in
            
             let size = proxy.size
            
            VStack{
                
                
                HStack{
                    
                    
                    Button {
                        
                        withAnimation(.easeInOut){
                            
                            showDetailContent = false
                        }
                        withAnimation(.easeInOut.delay(0.05)){
                            
                            model.showDetail = false
                        }
                        
                    } label: {
                        
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundColor(black)
                            .padding(12)
                            .background{
                             
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.white)
                            }
                    }
                    
                    Spacer()
                    
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "suit.heart.fill")
                            .font(.title3)
                            .foregroundColor(.red)
                            .padding(12)
                            .background{
                             
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.white)
                            }
                    }
                    
                    

                    
                }
                .padding()
                .opacity(showDetailContent ? 1 : 0)
                
                Image(funiture.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                   
                    .matchedGeometryEffect(id: funiture.id + "Image", in: animation)
                    .frame(height: size.height / 3)
                
                
                VStack(alignment: .leading, spacing: 13) {
                    
                    
                    HStack(spacing:10){
                        
                        
                        Text(funiture.title)
                            .fontWeight(.semibold)
                            .foregroundColor(black)
                            .fixedSize()
                            .lineLimit(1)
                            .matchedGeometryEffect(id: funiture.id + "TITLE", in: animation)
                        
                        
                        
                        Text("By Seto")
                            .font(.callout.weight(.light))
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: funiture.id + "BYSETO", in: animation)
                        
                        
                        Spacer()
                        
                        
                        Label {
                            
                            
                            Text("5.7")
                                .fontWeight(.bold)
                            
                        } icon: {
                            
                        Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.title3)
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background{
                        
                            
                            Capsule()
                                .strokeBorder(.gray,lineWidth: 2)
                        }
                        

                    
                    }
                    .padding(.horizontal)
                    
                    
                    Text("Crafted with a perfect construction by Seto Febriant and have a balancing ergonomic for humans body, top quality leather in the back of the rest.")
                        .foregroundColor(.gray)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .padding(.vertical)
                    
                    
                    HStack(spacing:12){
                        
                        Text("Color")
                            .fontWeight(.semibold)
                        
                        
                        ForEach(["Color1","Color2","Color3"],id:\.self){color in
                            
                            
                           Circle()
                                .fill(Color(color))
                                .frame(width: 15, height: 15)
                                .background{
                                 
                                    
                                    Circle()
                                        .strokeBorder(.gray,lineWidth: 1.2)
                                        .padding(-5)
                                        .opacity(activeColor == color ? 1 : 0)
                                }
                                .onTapGesture {
                                    
                                    activeColor = color
                                }
                                
                        }
                        
                        
                        Spacer()
                        
                        
                        
                        HStack(spacing:10){
                            
                            Image(systemName: "minus")
                                .onTapGesture {
                                    
                                   if  count > 0  {count -= 1}
                                }
                            
                            Text("\(count)")
                                .font(.footnote)
                            
                            Image(systemName: "plus")
                                .onTapGesture {
                                    count += 1
                                }
                            
                            
                            

                        }
                        .font(.title3)
                        .foregroundColor(black)
                        .padding(.vertical,12)
                        .padding(.horizontal)
                        .background{
                         
                            Capsule()
                                .fill(black.opacity(0.3))
                        }
                    }
                    
                    
                    
                    
                    Spacer()
                    
                  Rectangle()
                        .fill(Color.gray)
                        .frame(height: 1)
                    
                    
                    HStack{
                        
                        Text(funiture.price)
                            .font(.largeTitle.weight(.bold))
                            .foregroundColor(black)
                        
                        
                        Spacer()
                        
                        
                        
                        Button {
                            
                        } label: {
                            
                            Text("BUY Now")
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
                    
                    
                }
                .padding(.horizontal)
                .background{
                
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        .ignoresSafeArea()
                }
                .opacity(showDetailContent ? 1 : 0)
                
                
        
                
            
                
                
                
                
            }
         
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background{
        
            
            Color("BG")
                .ignoresSafeArea()
               .opacity(showDetailContent ? 1 : 0)
        }
        .onAppear {
           showDetailContent = true
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
