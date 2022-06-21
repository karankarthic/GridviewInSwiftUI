//
//  ContentView.swift
//  GridviewInSwiftUI
//
//  Created by Karan Karthic Neelamegan on 13/06/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                EmiCalcusView()
                    .padding()
                    .navigationTitle("EMI Calculator")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//@objc private func calculate(){
//
//    let principal = Double(principalField.text ?? "0") ?? 0
//    let interest = Double(intrestField.text ?? "0") ?? 0
//    let tenure = Double(tenureField.text ?? "0") ?? 0
//
//    let tenureValue:Double
//
//    let tenureChoice = tenureChoiceSecment.selectedSegmentIndex
//
//    if  tenureChoice == 0{
//        tenureValue = tenure
//    }else{
//        tenureValue = (tenure/12)
//    }
//
//    self.dataSource.updateValue(valuesForEMICalcus: .init(principal: principal, interest: interest, tenure: tenureValue))
//
//    monthlyEmiLable.text = "EMI - RS.\(dataSource.emiPerMonth())"
//
//    emiChartValues = dataSource.getEmiChartvalues()
//
//}
//
//@objc private func reset(){
//    principalField.text = "100000"
//    intrestField.text = "10"
//    tenureField.text = "1"
//
//    self.dataSource.updateValue(valuesForEMICalcus: .init(principal: 0, interest: 0, tenure: 0))
//    self.view.endEditing(true)
//}
//
//@objc private func pushEMITable(){
//
////        if dataSource.data.tenure > 1{
//        let Vc = EMIGridController()
//        Vc.data = emiChartValues
//        self.navigationController?.pushViewController(Vc, animated: true)
////        }
//
//}
