//
//  ContentView.swift
//  TemperatureCalculate
//
//  Created by jacob aberasturi on 1/13/23.
//

import SwiftUI

struct ContentView: View {
    @State private var val = 0.0
    let Units =  ["fehrenheit", "celsius", "kelvin"]
    @State private var selectedUnit = "fehrenheit"
    @State private var selectedOutputUnit = "fehrenheit"
    
    var inputInit: Measurement<UnitTemperature> {
        if selectedUnit == "fehrenheit" {
            return Measurement(value: val, unit: UnitTemperature.fahrenheit)
        }
        else if selectedUnit == "celsius" {
            return Measurement(value: val, unit: UnitTemperature.celsius)
        }
        return Measurement(value: val, unit: UnitTemperature.kelvin)
    }
    
    var res : Measurement<UnitTemperature> {
        if selectedOutputUnit == "fehrenheit" {
            return inputInit.converted(to: .fahrenheit)
        }
        else if selectedOutputUnit == "celsius" {
            return inputInit.converted(to: .celsius)
        }
        
        return inputInit.converted(to: .kelvin)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("enter a temperature to be converted", value: $val, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Which Unit is this?", selection: $selectedUnit) {
                        ForEach(Units, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                } header: {
                    Text("Please enter a temperature to be converted")
                }
                
                Section {
                    Picker("Please select a output unit", selection: $selectedOutputUnit) {
                        ForEach(Units, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                } header: {
                    Text("Choose Output format")
                }
                Section {
                    Text("Result: \(res.description)")
                }
            } .navigationTitle("Temperature Calculate")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
