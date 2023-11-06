//
//  ProfilePage.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 18.05.2023.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    
                    Text ("My Profile")
                        .font(.custom(customFont, size:28).bold ())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15){
                    Image ("Profile_Image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .offset(y: -30)
                            .padding(.bottom,-30)
                        
                        Text ("Gizem Turker")
                            .font(.custom(customFont, size: 16))
                            .fontWeight(.semibold)
                    
                        HStack(alignment: .top, spacing: 10) {
                    
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.gray)
                                .rotationEffect(.init(degrees: 180))
                            
                            Text("Address: 43 Besiktas Road\nTurkali 5\nIstanbul,Turkey" )
                                .font(.custom(customFont, size: 15))
                            }
                        .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                    .padding([.horizontal,.bottom])
                    .background(
                    
                        Color.white
                            .cornerRadius(12)
                    )
                    .padding()
                    .padding(.top,40)
                    
                    // Custom navigation links
                    
                    CustomNavigationLink(title: "Edit Profile") {
                        
                        Text("")
                            .navigationTitle("Edit Profile")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                Color("HomeBG").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Shopping adress") {
                        
                        Text("")
                            .navigationTitle("Shopping adress")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                Color("HomeBG").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Order history") {
                        
                        Text("")
                            .navigationTitle("Order history")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                Color("HomeBG").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Cards") {
                        
                        Text("")
                            .navigationTitle("Cards")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                Color("HomeBG").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Notifications") {
                        
                        Text("")
                            .navigationTitle("Notifications")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                Color("HomeBG").ignoresSafeArea())
                    }
                    
   
                    
                    
                }
                .padding (.horizontal, 22)
                .padding (.vertical,20)
                
            }
            .navigationBarHidden (true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("HomeBG")
                    .ignoresSafeArea()
            )
        }
    }
    
    //avoiding new structs
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String,@ViewBuilder content:
        @escaping ()->Detail)-> some View{
        
        NavigationLink {
            content()
        } label: {
            
            HStack{
                Text(title)
                    .font(.custom(customFont, size: 17))
                    .fontWeight(.semibold)
            
                Spacer()
            
                Image (systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding ()
            .background (
                
            Color.white
                .cornerRadius (12)
            )
            .padding (.horizontal)
            .padding (.top,10)
        }

    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
