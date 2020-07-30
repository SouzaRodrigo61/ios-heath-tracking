//
//  HealthView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 30/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//


/*
 
 "childhoodDiseases": true,
 "congenitaldiseases": true,
 "healthTreatment": true,
 "heartDiseases": true,
 "kidneyDiseases": true,
 "neurologicalDiseases": true,
 "otherComorbidities": true,
 "respiratoryDiseases": true,
 "weight": 0
 "height": 0,
 
*/


import SwiftUI

struct HealthView: View {
    @State private var isToggle : Bool = false
    @State var isWorking: Bool = true
    
    var body: some View {
        VStack {
            if isWorking {
                Spacer()
                WorkingInProgressView()
                Text("🚧 Working in progress 🚧")
                Spacer()
            } else {

                VStack {
                    
                    Text("Sua saude")
                        .font(.title)
                    
                    Spacer()
                    
                    VStack {
                        VStack {
                            Toggle(isOn: $isToggle){
                                Text("Doenças de criança ")
                                
                            }
                        }
                        .padding()
                        
                        VStack {
                            Toggle(isOn: $isToggle){
                                Text("Doenças congênitas ")
                                
                            }
                        }
                        .padding()
                        
                        VStack {
                            Toggle(isOn: $isToggle){
                                Text("Tratamento de saúde ")
                                
                            }
                        }
                        .padding()
                        
                        VStack {
                            Toggle(isOn: $isToggle){
                                Text("Doenças cardíacas ")
                                
                            }
                        }
                        .padding()
                        
                        VStack {
                            Toggle(isOn: $isToggle){
                                Text("Doenças renais ")
                                
                            }
                        }
                        .padding()
                        
                        VStack {
                            Toggle(isOn: $isToggle){
                                Text("Doenças neurológicas ")
                                
                            }
                        }
                        .padding()
                        
                        VStack {
                            Toggle(isOn: $isToggle){
                                Text("Doenças respiratórias ")
                                
                            }
                        }
                        .padding()
                        
                        VStack {
                            Toggle(isOn: $isToggle){
                                Text("Outras comorbidades ")
                                
                            }
                        }
                        .padding()
                    }
                    
                    Spacer()
                }
            }
        }

    }
}

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
    }
}
