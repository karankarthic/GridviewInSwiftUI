//
//  EmiChartTable.swift
//  GridviewInSwiftUI
//
//  Created by Karan Karthic Neelamegan on 20/06/22.
//

import SwiftUI

struct EmiChartTable: View {
    @State var chartValue:EMITableChartValues = .init(values: [])
    
    
    var body: some View {
        NavigationView{
            ScrollView([.horizontal, .vertical]){
                VStack {
                    ForEach(chartValue.values, id: \.self) { item in
                        HStack{
                            ForEach(item.returnArrayOFValues(), id: \.self) { value in
                                Text("\(value)")
                                    .textFieldStyle(.roundedBorder)
                                    .lineLimit(1)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .frame(minWidth: 100, maxWidth: 400)
                                    
                            }
                        }
                        
                    }
                }
            }
            .navigationTitle("Emi chart")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EmiChartTable_Previews: PreviewProvider {
    static var previews: some View {
        EmiChartTable()
    }
}
