//
//  SVGRepresentables.swift
//  life tracking
//
//  Created by Rodrigo Santos on 20/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import Macaw

struct SVGRepresentable: UIViewRepresentable {

    var svgName: String
    let svgView = SVGView()
    
    func makeUIView(context: Context) -> SVGView {

        svgView.backgroundColor = UIColor(white: 1.0, alpha: 0.0)   // otherwise the background is black
        svgView.fileName = self.svgName
        svgView.contentMode = .scaleAspectFill
        
        return svgView
    }

    func updateUIView(_ uiView: SVGView, context: Context) {

    }
    
    func changeNodeColor(nodeTag: String) {
        svgView.node.nodeBy(tag: nodeTag)?.onTouchPressed({ (touch) in
            //Add an action to execute when specific node was touched
            //Change node color
            self.changeNodeColor(nodeTag: nodeTag)
        })
    }

}
