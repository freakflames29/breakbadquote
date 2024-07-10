//
//  Test.swift
//  BBQuotes
//
//  Created by sourav das on 08/07/24.
//

import SwiftUI

struct Test: View {
    let Sample = TestController()
    
    var body: some View {
       
        List(Sample.quoteDecodedData,id:\.quote){ x in
            
            Text("x.character")
            
        }
    }
}

#Preview {
    Test()
}
