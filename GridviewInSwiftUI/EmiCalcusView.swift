//
//  EmiCalcusView.swift
//  GridviewInSwiftUI
//
//  Created by Karan Karthic Neelamegan on 14/06/22.
//

import SwiftUI



struct EmiCalcusView: View {
    
    @State var principalValue:String = "100000"
    @State var intrestValue:String = "10"
    @State var tentueValue:String = "1"
    @State var tenureChoice:Int = 0
    
    @State var dataSource:EMICalculaterDataSource = .init()
    @State var emiString:String = "waiting To calculate..."
    @State var isTableChartPresent:Bool = false
    
    var body: some View {
        
            VStack{
                InPutView(title: "Principal", value: $principalValue)
                InPutView(title: "Interest", value: $intrestValue)
                InPutView(title: "Tenture", value: $tentueValue)
                Picker("", selection: $tenureChoice) {
                    ForEach([0,1], id: \.self) {
                        if $0 == 0{
                            Text("years")
                        }else{
                            Text("Month")
                        }
                    }
                }
                .frame(width: 200.0, height: 50)
                .fixedSize()
                .pickerStyle(.segmented)
                ZStack{
                    Capsule()
                        .frame(width: 150.0, height: 38.0)
                        .fixedSize()
                        .foregroundColor(.orange)
                    Button("Calculate"){
                        calculate()
                    }
                    .foregroundColor(.primary)
                    
                }
                
                ZStack{
                    Capsule()
                        .frame(width: 100.0, height: 38.0)
                        .fixedSize()
                        .foregroundColor(.red)
                        .opacity(0.7)
                    Button("Reset"){
                        reset()
                    }
                    .foregroundColor(.primary)
                    
                }
                
                ZStack{
                    Rectangle()
                        .frame(width: 300.0, height: 50)
                        .foregroundColor(.orange)
                        .cornerRadius(10)
                    Text(emiString)
                }
                
                ZStack{
                    Capsule()
                        .frame(width: 300.0, height: 38.0)
                        .fixedSize()
                        .foregroundColor(.orange)
                        .opacity(0.6)
                    Button("Emi Table"){
                        if dataSource.emiPerMonth() != 0{
                            isTableChartPresent.toggle()
                        }
                            
                    }
                    .foregroundColor(.primary)
                    .sheet(isPresented: $isTableChartPresent) {
                        EmiChartTable(chartValue: dataSource.getEmiChartvalues())
                    }
                }
                
            }
            .padding()
      
    }
    
    private func calculate(){
    
        let principal = Double(principalValue ) ?? 0
        let interest = Double(intrestValue ) ?? 0
        let tenure = Double(tentueValue) ?? 0
    
        let tenureValue:Double
        
        if  tenureChoice == 0{
            tenureValue = tenure
        }else{
            tenureValue = (tenure/12)
        }
    
        self.dataSource.updateValue(valuesForEMICalcus: .init(principal: principal, interest: interest, tenure: tenureValue))
    
        emiString = "EMI - RS.\(dataSource.emiPerMonth())"
    
//        emiChartValues = dataSource.getEmiChartvalues()
    
    }
    
    private func reset(){
    
        
        principalValue = "100000"
        intrestValue = "10"
        tentueValue = "1"
        tenureChoice = 0
    
        emiString = "waiting To calculate..."
    
//        emiChartValues = []
    
    }
    
}

struct InPutView:View{
    @State var title:String = "skdjnksn"
    @Binding var value:String
    var body: some View {
        HStack{
            ZStack{
                Capsule()
                    .frame(height: 38.0)
                    .foregroundColor(.orange)
                Text(title)
                
            }
            .frame(width: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
            .fixedSize()
            VStack{
                ZStack{
                    if value.isEmpty{
                        Text("Enter the \(title)...")
                            .font(.footnote)
                            .foregroundColor(Color.primary.opacity(0.3))
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .offset(x: -15, y: 0)
                            .frame(width: 150.0, height: 23.0)
                        
                    }
                    TextField(value, text: $value)
                        .keyboardType(.decimalPad)
                }
                Divider()
                
            }
            .frame(width: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
            .fixedSize()
            
        }
        .frame(width: 300.0, height: 49.0)
        
        
    }
    
}

struct EmiCalcusView_Previews: PreviewProvider {
    static var previews: some View {
        EmiCalcusView()
    }
}
