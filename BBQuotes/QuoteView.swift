//
//  QuoteView.swift
//  BBQuotes
//
//  Created by sourav das on 09/07/24.
//

import SwiftUI


struct NoHighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 1  : 1.0) // This ensures no opacity change when pressed
    }
}

struct QuoteView: View {
    let vm = ViewModel()
    let show : String
    @State var sprakleBounce : Bool = false
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: geo.size.width * 2.5, height: geo.size.height * 1.1)
                
                
                VStack {
                    Text("\"\(vm.quote.quote) \"")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 5))
                        .padding(.horizontal)
                    
                    //image view
                    ZStack(alignment: .bottom){
                        AsyncImage(url: vm.charecters.images[0]) { img in
                            /// here we can add the image modifiers
                            img
                                .resizable()
                                .scaledToFill()
                            
                        } placeholder: {
                            
                            /// here we will show the progress spinner while image is fetching
                            ProgressView()
                        }
                        .frame(width: geo.size.width/1.1 , height: geo.size.height / 1.8)
                        
                        Text(vm.charecters.name)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: geo.size.width) /// or i can do .infinity
                            .background(.ultraThinMaterial)
                        
                        
                        
                        
                        
                    }
                    .frame(width: geo.size.width/1.1 , height: geo.size.height / 1.8)
                    .clipShape(.rect(cornerRadius: 30))
                    
                    
                    Button{
                        print("Get bb quote")
                        self.sprakleBounce.toggle()
                    } label: {
                        Label("Get quote",systemImage: "sparkles")
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .padding(.horizontal,50)
                            .padding(.vertical,20)
                            .background(.breakingBad)
                            .cornerRadius(10)
                            .symbolEffect(.bounce, value: sprakleBounce)
                        
                        
                    }.buttonStyle(NoHighlightButtonStyle())
                    
                }.frame(width: geo.size.width)
            }
            .frame(width: geo.size.width,height: geo.size.height)
        }.ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
}
