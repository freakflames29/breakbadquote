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
    
    @State var showCharectorView: Bool = false
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: geo.size.width * 2.5, height: geo.size.height * 1.1)
                
                
                VStack {
                    
                    
                    VStack{
                        
                        Spacer(minLength: 60)
                        switch vm.status {
                                
                            case .notStarted:
                                EmptyView()
                            case .fetching:
                                ProgressView()
                            case .success:
                               
                                Text("\"\(vm.quote.quote)\"")
                                    .minimumScaleFactor(0.5)
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
                                    .onTapGesture {
                                        self.showCharectorView.toggle()
                                    }
                                    
                                    Text(vm.charecters.name)
                                        .foregroundStyle(.white)
                                        .padding()
                                        .frame(maxWidth: geo.size.width) /// or i can do .infinity
                                        .background(.ultraThinMaterial)
                                    
                                    
                                    
                                    
                                    
                                }
                                .frame(width: geo.size.width/1.1 , height: geo.size.height / 1.8)
                                .clipShape(.rect(cornerRadius: 30))
                                
                            
                            case .failed(let error):
                                Text(error.localizedDescription)
                        }
                        
                        Spacer()
                        
                    }
                    
                    
                    
                    
                    Button{
                        print("Get bb quote")
                        self.sprakleBounce.toggle()
                        
                        Task{
                            await vm.fetchData(for: show)
                        }
                    } label: {
                        Label("Get quote",systemImage: "sparkles")
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .padding(.horizontal,50)
                            .padding(.vertical,20)
                            .background(Color(self.show.replacingOccurrences(of: " ", with: "")))
                            .cornerRadius(10)
                            .symbolEffect(.bounce, value: sprakleBounce)
                        
                        
                        
                    }.buttonStyle(NoHighlightButtonStyle())
                    
                    Spacer(minLength: 95)
                }.frame(width: geo.size.width,height: geo.size.height)
            }
            .frame(width: geo.size.width,height: geo.size.height)
        }.ignoresSafeArea()
        .sheet(isPresented: $showCharectorView) {
                CharectorView(charector: vm.charecters, show: self.show)
            }
    }
        
}

#Preview {
    QuoteView(show: "Breaking Bad")
}
