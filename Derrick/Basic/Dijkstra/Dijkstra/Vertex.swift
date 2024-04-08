//
//  Vertex.swift
//  Dijkstra
//
//  Created by Derrick kim on 2/22/24.
//

import Foundation

// 그래프의 정점을 나타내는 클래스
final class Vertex: Equatable {
    let name: String
    var edges: [(Vertex, Double)] = [] // (인접 정점, 가중치) 쌍을 저장하는 배열
    var shortestPath = Double.infinity // 최단 경로를 저장하는 변수

    init(name: String) {
        self.name = name
    }

    static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.name == rhs.name
    }
}
