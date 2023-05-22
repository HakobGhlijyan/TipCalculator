//
//  ContentView.swift
//  lesson15-16-CalculatorTea
//
//  Created by Hakob Ghlijyan on 22.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeaple = 2
    @State private var tipPercent = 0
    
    var percent = [0,5,10,15,20]
    
    var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeaple + 2)
        let tipSelection = Double(percent[tipPercent])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let total = orderAmount + tipValue
        let amountPerson = total / peopleCount
        
        return amountPerson
        
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                    Picker("Number of peaple", selection: $numberOfPeaple) {
                        ForEach(2..<7) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("Сколько чаевых вы хотите оставить")) {
                    Picker("Tip Percent", selection: $tipPercent){
                        ForEach(0..<percent.count, id: \.self) {
                            Text("\(self.percent[$0]) %")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    HStack {
                        Text("\(totalPerPerson, specifier: "%.2f")")
                        Spacer()
                        Image(systemName: "dollarsign.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Button {
                            // action
                        } label: {
                            Text("Pay")
                        }
                        
                    }
                }
                
            }
            .navigationTitle("Калькулятор Чаевых")
            //.navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
