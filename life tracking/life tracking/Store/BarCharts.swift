//
//  Bar.swift
//  life tracking
//
//  Created by Rodrigo Santos on 20/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct BarChart : View {
    
    @State var selected = 0
    var colors = [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]
    
    
    var body: some View{
        
        VStack(alignment: .leading) {
            
            // Bar Chart...
            VStack(alignment: .leading) {
                VStack {
                    Text("Relatorio de Covid")
                        .font(.body)
                        .fontWeight(.bold)
                }
                .padding(.leading, 10)
                
                HStack(spacing: 15) {
                    ForEach(workout_Data) { work in
                        
                        VStack {
                            VStack {
                                Spacer(minLength: 0)
                                if self.selected == work.id {
                                    Text(self.getHrs(value: work.workout_In_Min))
                                        .foregroundColor(Color.secondary)
                                        .padding(.bottom,5)
                                }
                                RoundedShape()
                                    .fill(LinearGradient(gradient: .init(colors: self.selected == work.id ? self.colors : [Color.gray.opacity(0.08)]), startPoint: .top, endPoint: .bottom))
                                    
                                    .frame(height: self.getHeight(value: work.workout_In_Min))
                            }
                            .frame(height: 210)
                            .onTapGesture {
                                withAnimation(.easeOut){
                                    self.selected = work.id
                                }
                            }
                            Text(work.day)
                                .font(.caption)
                                .foregroundColor(Color.secondary)
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
            .cornerRadius(10)
        }
        
    }
    
    
    // converting Number to decimal...
    
    func getDec(val: CGFloat) -> String {
        
        let format = NumberFormatter()
        format.numberStyle = .decimal
        
        return format.string(from: NSNumber.init(value: Float(val)))!
    }
    
    // calculating percent...
    
    func getPercent(current : CGFloat,Goal : CGFloat) -> String {
        
        let per = (current / Goal) * 100
        
        return String(format: "%.1f", per)
    }
    
    // calculating Hrs For Height...
    
    func getHeight(value : CGFloat) -> CGFloat {
        
        // the value in minutes....
        // 24 hrs in min = 1440
        
        let hrs = CGFloat(value / 1440) * 200
        
        return hrs
    }
    
    // getting hrs...
    
    func getHrs(value: CGFloat) -> String {
        
        let hrs = value / 60
        
        return String(format: "%.1f", hrs)
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}

struct RoundedShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 5, height: 5))
        
        return Path(path.cgPath)
    }
}

// sample Data...

struct Daily : Identifiable {
    
    var id : Int
    var day : String
    var workout_In_Min : CGFloat
}

var workout_Data = [
    
    Daily(id: 0, day: "Day 1", workout_In_Min: 480),
    Daily(id: 1, day: "Day 2", workout_In_Min: 880),
    Daily(id: 2, day: "Day 3", workout_In_Min: 250),
    Daily(id: 3, day: "Day 4", workout_In_Min: 360),
    Daily(id: 4, day: "Day 5", workout_In_Min: 1220),
    Daily(id: 5, day: "Day 6", workout_In_Min: 750),
    Daily(id: 6, day: "Day 7", workout_In_Min: 950)
]

// stats Data...

struct Stats : Identifiable {
    
    var id : Int
    var title : String
    var currentData : CGFloat
    var goal : CGFloat
    var color : Color
}

var stats_Data = [
    
    Stats(id: 0, title: "Running", currentData: 6.8, goal: 15, color: Color("running")),
    
    Stats(id: 1, title: "Water", currentData: 3.5, goal: 5, color: Color("water")),
    
    Stats(id: 2, title: "Energy Burn", currentData: 585, goal: 1000, color: Color("energy")),
    
    Stats(id: 3, title: "Sleep", currentData: 6.2, goal: 10, color: Color("sleep")),
    
    Stats(id: 4, title: "Cycling", currentData: 12.5, goal: 25, color: Color("cycle")),
    
    Stats(id: 5, title: "Steps", currentData: 16889, goal: 20000, color: Color("steps")),
]
