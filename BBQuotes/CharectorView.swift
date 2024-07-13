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
            ZStack(alignment: .top){
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .scaledToFit()
                
                ScrollView{
                    TabView{
                        ForEach(charector.images,id: \.self) {charURL in
                            
                            AsyncImage(url: charURL) { image in
                                image.resizable()
                                    .scaledToFit()
                                
                                
                            } placeholder: {
                                ProgressView()
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
                                
                                if let death = charector.death{
                                    AsyncImage(url: death.image ) { image in
                                        image.resizable()
                                            .scaledToFit()
                                        
                                        
                                    }placeholder: {
                                        ProgressView()
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
                        .padding(.bottom,340)
                    
                }
                .scrollIndicators(.hidden)
                
                
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    CharectorView(charector: ViewModel().charecters, show: "Breaking Bad")
}
