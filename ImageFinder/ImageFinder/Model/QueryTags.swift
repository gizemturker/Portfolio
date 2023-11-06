//
//  QueryTags.swift
//  ImageFinder
//
//  Created by Gizem Turker on 30.10.2023.
//

import SwiftUI

struct QueryTags: View {
    var query: Query
    var isSelected: Bool
    
    var body: some View {
        Text(query.rawValue)
            .font(.caption)
            .bold()
            .foregroundColor(isSelected ? .black: .gray)
    }
}

#Preview {
    QueryTags(query: Query.people, isSelected: true)
}
