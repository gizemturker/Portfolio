//
//  CheckmarkView.swift
//  TaskList
//
//  Created by Gizem Turker on 2.10.2023.
//

import SwiftUI

struct CheckmarkView: View {
    let isCompleted: Bool

    var body: some View {
        Image(systemName: isCompleted ? "checkmark.square.fill" : "square")
            .foregroundColor(isCompleted ? .green : .red)
    }
}

struct CheckmarkView_Previews: PreviewProvider {
    static var previews: some View {
        CheckmarkView(isCompleted: true)
    }
}



