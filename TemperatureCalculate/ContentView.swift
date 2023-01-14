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
                    TextField("Please enter a temperature to be convereted", value: $val, format: .number)
                    Picker("Which Unit is this?", selection: $selectedUnit) {
                        ForEach(Units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Picker("Please select a output unit", selection: $selectedOutputUnit) {
                        ForEach(Units, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                }
                Section {
                    Text("Result: \(res.description)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
