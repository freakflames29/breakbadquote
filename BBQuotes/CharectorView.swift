//
//  CharectorView.swift
//  BBQuotes
//
//  Created by sourav das on 13/07/24.
//

import SwiftUI

struct CharectorView: View {
    let charector : CharectorModel
    let show : String
    
    var body: some View {
        GeometryReader{ geo in
            ScrollViewReader{proxy in
                
                ZStack(alignment: .topLeading){
//                    Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
//                        .resizable()
//                        .scaledToFit()
                    
                    ScrollView{
                        TabView{
                            ForEach(charector.images,id: \.self) {charURL in
                                
                                AsyncImage(url: charURL) { image in
                                    image.resizable()
                                        .scaledToFill()
                                    
                                    
                                } placeholder: {
                                    ProgressView(label:{
                                        Text("Loading")
                                            .frame(maxWidth: .infinity)
                                    })
                                }
                                .clipShape(.rect(cornerRadius: 25))
                                
                            }
                        }
                        .tabViewStyle(.page)
                        
                        .frame(width: geo.size.width/1.4, height: geo.size.height/2)
                        
                        .padding(.top,50)
                        
                        
                        VStack(alignment: .leading){
                            Text(charector.name)
                                .font(.system(size: 40))
                                .minimumScaleFactor(0.3)
                                .bold()
                            
                            Text("Potraied by: \(charector.portrayedBy)")
                                .font(.subheadline)
                            
                            Divider()
                            
                            Text("Charector Info: ")
                                .font(.title2)
                                .bold()
                            Text("Birthday : \(charector.birthday)")
                                .font(.subheadline)
                            
                            Divider()
                            
                            Text("Occupations")
                                .font(.title2)
                                .bold()
                                .padding(.bottom,3)
                            
                            ForEach(charector.occupations , id: \.self) { occu in
                                Text("→ \(occu)" )
                                    .padding(.bottom,3)
                            }
                            
                            Divider()
                            Text("Nick Names ")
                                .font(.title2)
                                .bold()
                                .padding(.bottom,3)
                            
                            if (charector.aliases.count > 0 ){
                                ForEach(charector.aliases , id: \.self) { nickName in
                                    Text("→ \(nickName)" )
                                        .padding(.bottom,3)
                                }
                            }
                            else {
                                Text("None")
                            }
                            
                            DisclosureGroup("Status (Spoiler Alert) ") {
                                VStack(alignment: .leading){
                                    Text(charector.status)
                                        .font(.title3)
                                        .bold()
                                        .onAppear{
                                            withAnimation{
                                                proxy.scrollTo(1, anchor: .bottom)
                                            }
                                        }
                                       
                                    
                                    if let death = charector.death{
                                        AsyncImage(url: death.image ) { image in
                                            image.resizable()
                                                .scaledToFit()
                                                .onAppear {
                                                    withAnimation{
                                                        proxy.scrollTo(1, anchor: .bottom)
                                                    }
                                                }
                                            
                                            
                                        }placeholder: {
                                            ProgressView(label:{
                                                Text("Loading")
                                                    .frame(maxWidth: .infinity)
                                            })
                                        }
                                        .clipShape(.rect(cornerRadius: 20))
                                        .padding(.bottom,10)
                                        
                                        Text("How did he died ?")
                                            .bold()
                                        
                                        Text(death.details)
                                            .padding(.bottom,10)
                                        
                                        Text("Last words")
                                            .bold()
                                        
                                        Text("\" \(death.lastWords)\"")
                                        
                                    }
                                }
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            }
                          
                            
                            
                            
                            
                        }.frame(width: geo.size.width/1.3,alignment: .leading)
                            .padding(.bottom,20)
                            .id(1)
                        
                    }
                    .frame(width: geo.size.width,height: geo.size.height)
                    .scrollIndicators(.hidden)
                    
                    
                }
                
                
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    CharectorView(charector: ViewModel().charecters, show: "Breaking Bad")
}
