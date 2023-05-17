//
//  Lesson3.swift
//  MixLab
//
//  Created by Will Pitchfork on 30/03/2023.
//

import SwiftUI
import Flow


func simplePatch() -> Patch {
//    let generator = Node(name: "generator", titleBarColor: Color.cyan, outputs: ["out"])
//    let processor = Node(name: "processor", titleBarColor: Color.red, inputs: ["in"], outputs: ["out"])
//    let mixer = Node(name: "mixer", titleBarColor: Color.gray, inputs: ["in1", "in2"], outputs: ["out"])
//    let output = Node(name: "output", titleBarColor: Color.purple, inputs: ["in"])
    
//    let correctAnswer: [String] = ["Flow.Wire(output: Flow.OutputID(nodeIndex: 3, portIndex: 0), input: Flow.InputID(nodeIndex: 6, portIndex: 0))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 6, portIndex: 1), input: Flow.InputID(nodeIndex: 7, portIndex: 1))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 2, portIndex: 0), input: Flow.InputID(nodeIndex: 5, portIndex: 0))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 6, portIndex: 0), input: Flow.InputID(nodeIndex: 7, portIndex: 0))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 1, portIndex: 0), input: Flow.InputID(nodeIndex: 4, portIndex: 0))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 2, portIndex: 1), input: Flow.InputID(nodeIndex: 5, portIndex: 1))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 5, portIndex: 1), input: Flow.InputID(nodeIndex: 6, portIndex: 3))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 0, portIndex: 0), input: Flow.InputID(nodeIndex: 3, portIndex: 0))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 5, portIndex: 0), input: Flow.InputID(nodeIndex: 6, portIndex: 2))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 4, portIndex: 0), input: Flow.InputID(nodeIndex: 6, portIndex: 1))"]
//
    
    
    let kick = Node(name: "Kick Drum", position: CGPoint(x: 50, y: 25), titleBarColor: CustomLightBlue, locked: true, outputs: ["Port hole"])
    let bass = Node(name: "Bass", position: CGPoint(x: 50, y: 275), titleBarColor: CustomLightBlue, locked: true, outputs: ["DI"])
    let keys = Node(name: "Keys", position: CGPoint(x: 50, y: 525), titleBarColor: CustomLightBlue, locked: true, outputs: ["Left", "Right"])
    
    let mic1 = Node(name: "Microphone", position: CGPoint(x: 350, y: 275), titleBarColor: CustomLightBlue, locked: true, inputs: ["Source"], outputs: ["XLR"])
    
    let DI1 = Node(name: "DI", position: CGPoint(x: 350, y: 525), titleBarColor: CustomLightBlue, locked: true, inputs: ["Source"], outputs: ["XLR", "Link"])
    
    let SDI1 = Node(name: "StereoDI", position: CGPoint(x: 350, y: 25), titleBarColor: CustomLightBlue, locked: true, inputs: ["Source L", "Source R"], outputs: ["XLR L", "XLR R", "Link"])
    
    let mixer = Node(name: "Mixing Desk", position: CGPoint(x: 650, y: 225), titleBarColor: CustomLightBlue, locked: true, inputs: ["Channel 1", "Channel 2", "Channel 3", "Channel 4"], outputs: ["Left", "Right"])
    
    let output = Node(name: "Output", position: CGPoint(x: 950, y: 225), titleBarColor: CustomLightBlue, locked: true, inputs: ["Left", "Right"])
    
//    let nodes = [generator, processor, generator, processor, mixer, output, kick, snare]
    let nodes = [kick, bass, keys, mic1, DI1, SDI1, mixer, output]
    
    let wires = Set([Wire(from: OutputID(0, 0), to: InputID(3, 0))
                    ])

    let patch = Patch(nodes: nodes, wires: wires)
    //patch.recursiveLayout(nodeIndex: 8, at: CGPoint(x: 800, y: 50))
    return patch
}

struct Game1: View {
    @State var patch = simplePatch()
    @State var selection = Set<NodeIndex>()
    
//    let correctAnswer: [String] = ["Flow.Wire(output: Flow.OutputID(nodeIndex: 3, portIndex: 0), input: Flow.InputID(nodeIndex: 6, portIndex: 0))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 6, portIndex: 1), input: Flow.InputID(nodeIndex: 7, portIndex: 1))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 2, portIndex: 0), input: Flow.InputID(nodeIndex: 5, portIndex: 0))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 6, portIndex: 0), input: Flow.InputID(nodeIndex: 7, portIndex: 0))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 1, portIndex: 0), input: Flow.InputID(nodeIndex: 4, portIndex: 0))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 2, portIndex: 1), input: Flow.InputID(nodeIndex: 5, portIndex: 1))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 5, portIndex: 1), input: Flow.InputID(nodeIndex: 6, portIndex: 3))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 0, portIndex: 0), input: Flow.InputID(nodeIndex: 3, portIndex: 0))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 5, portIndex: 0), input: Flow.InputID(nodeIndex: 6, portIndex: 2))",
//                          "Flow.Wire(output: Flow.OutputID(nodeIndex: 4, portIndex: 0), input: Flow.InputID(nodeIndex: 6, portIndex: 1))"]

    var body: some View {
        ZStack() {
            CustomPaleBlue
                .ignoresSafeArea()
                
            VStack {
                NodeEditor(patch: $patch, selection: $selection)
                
                Button("Print") {
                    print(patch.wires)
                }
            }
        }
    }
}

struct Game1_Previews: PreviewProvider {
    static var previews: some View {
        Game1()
    }
}
