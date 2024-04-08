//
//  main.swift
//  DFS와 BFS
//
//  Created by Derrick kim on 2023/04/14.
//

import Foundation

struct Card: Comparable {
    let number: Int
    let color: CardColor

    static func < (lhs: Card, rhs: Card) -> Bool {
        if lhs.number == rhs.number {
            // 숫자가 같을 경우 색깔 비교
            return lhs.color < rhs.color
        }

        return lhs.number < rhs.number
    }
}

enum CardColor: Character, Comparable {
    case black = "b"
    case red = "r"

    static func < (lhs: CardColor, rhs: CardColor) -> Bool {
        // 빨간색이 검정색보다 높다고 가정
        return lhs == .black && rhs == .red
    }
}

enum CardRanking {
    case top
    case pair
    case straight
    case straightFlush
}
// mycard 7b
// opponentCard 6r
// firstSharedCard 6b

// pair: 7r(S), 7b(MY)

// Straight: 5r(S), 6b(S), 7b(My)
// Straight: 6b(S), 7b(My), 8r(S)

// Straight Flush: 5b(S), 6b(S), 7b(My)
// Straight Flush: 6b(S), 7b(My), 8b(S)

//func solution3(_ cards: [String]) -> [String] {
//    let myCard = makeCard(cards[0])
//    let opponentCard = makeCard(cards[1])
//    let firstSharedCard = makeCard(cards[2])
//    var dicInfo: [CardRanking: [Card]] = [:]
//    var winCards: [String] = []
//
//    // 내가 Pair가 될수도 있고 안될수도 있고
//    if myCard.number != firstSharedCard.number {
//        var initNumber = myCard.number > firstSharedCard.number ? firstSharedCard.number : myCard.number
//
//        for number in initNumber-1...9 {
//            
//        }
//    } else {
//        // 내 카드 족보는 무조건 Pair만 가능하다.
//        // 이런 상황에서 이길려면
//        // rival이 나보다 적은 숫자를 가지는지 알아야 함
//
//        // 만약에 내가 더 큰 카드면
//        if myCard > opponentCard {
//            // 상대방이 pair 혹은 Top이 나와야 한다.
//        } else {
//            // 상대방이 Top인 상황이 되야 한다.
//        }
//    }
//
//    return winCards.isEmpty ? ["lose"] : winCards.sorted()
//}
//
//// 문자열로부터 Card 구조체 생성
//func makeCard(_ cardString: String) -> Card {
//    let number = Int(String(cardString.dropLast()))!
//    let color = CardColor(rawValue: cardString.last!)!
//    return Card(number: number, color: color)
//}

//func solution3(_ cards: [String]) -> [String] {
//    let suits = ["r", "b"] // Available card colors
//    var winningCards: Set<String> = [] // Use a set to avoid duplicates
//
//    // Extract player's and opponent's card and the shared card
//    let playerCard = cards[0], opponentCard = cards[1], sharedCard = cards[2]
//
//    // Function to check if three cards make a straight
//    func isStraight(_ numbers: [Int]) -> Bool {
//        let sortedNumbers = numbers.sorted()
//        return sortedNumbers[0] + 1 == sortedNumbers[1] && sortedNumbers[1] + 1 == sortedNumbers[2]
//    }
//
//    // Function to convert card string to a tuple of value and suit
//    func cardDetails(_ card: String) -> (value: Int, suit: String) {
//        let value = Int(card.prefix(1))!
//        let suit = String(card.suffix(1))
//        return (value, suit)
//    }
//
//    let (playerValue, playerSuit) = cardDetails(playerCard)
//    let (opponentValue, opponentSuit) = cardDetails(opponentCard)
//    let (sharedValue, sharedSuit) = cardDetails(sharedCard)
//
//    // Generate all possible second shared cards
//    for value in 1...9 {
//        for suit in suits {
//            let possibleCard = "\(value)\(suit)"
//
//            // Skip the card if it's the same as any of the already drawn cards
//            if possibleCard == playerCard || possibleCard == opponentCard || possibleCard == sharedCard {
//                continue
//            }
//
//            let possibleCombination = [playerValue, sharedValue, value].sorted()
//            // Check for straight or straight flush
//            if isStraight(possibleCombination) {
//                if suit == playerSuit && (playerSuit == sharedSuit || value == playerValue) {
//                    // Potential straight flush
//                    winningCards.insert(possibleCard)
//                } else if !(value == opponentValue && suit == opponentSuit) {
//                    // Potential straight
//                    winningCards.insert(possibleCard)
//                }
//            }
//
//            // Check for pair, excluding opponent's winning pair
//            if value == playerValue && !(value == opponentValue && suit == opponentSuit) {
//                winningCards.insert(possibleCard)
//            }
//        }
//    }
//
//    // Sort the results before returning
//    let sortedWinningCards = Array(winningCards).sorted()
//
//    return sortedWinningCards.isEmpty ? ["lose"] : sortedWinningCards
//}
//
//print("0: ", solution3(["7b", "6r", "6b"])) // 결과값: ["5b", "5r", "7r", "8b", "8r"]
//print("01: ", solution3(["6b", "7r", "7b"])) // 결과값: ["5b", "5r", "8b", "8r"]
//print("02: ", solution3(["1b", "4r", "3b"])) // 결과값: ["1r", "2b"]
//print("03: ", solution3(["9b", "9r", "7b"])) // 결과값: ["8b"]
//print("04: ", solution3(["1r", "9b", "9r"])) // 결과값: ["lose"]
//print("05: ", solution3(["9b", "1r", "9r"])) // 결과값: ["1b", "2b", "2r", "3b", "3r", "4b", "4r", "5b", "5r", "6r", "6b", "7b", "7r", "8b", "8r"]
//
//let n = Int(readLine()!)! // 컴퓨터의 수
//let m = Int(readLine()!)! // 네트워크 상에서 직접 연결된 컴퓨터 쌍의 수
//
//var graph = Array(repeating: [Int](), count: n + 1) // 그래프 초기화
//var visited = Array(repeating: false, count: n + 1) // 방문 여부 체크 배열
//
//// 그래프 구성
//for _ in 0..<m {
//    let connection = readLine()!.split(separator: " ").map { Int($0)! }
//    graph[connection[0]].append(connection[1])
//    graph[connection[1]].append(connection[0])
//}
//
//var infectedCount = 0 // 감염된 컴퓨터 수
//
//// DFS 함수
//func dfs(_ node: Int) {
//    visited[node] = true // 현재 노드 방문 처리
//    infectedCount += 1 // 감염된 컴퓨터 수 증가
//
//    for next in graph[node] { // 현재 노드와 연결된 모든 노드에 대해
//        if !visited[next] { // 아직 방문하지 않은 노드라면
//            dfs(next) // DFS 수행
//        }
//    }
//}
//
//dfs(1) // 1번 컴퓨터부터 시작
//
//print(infectedCount - 1) // 1번 컴퓨터 제외하고 감염된 컴퓨터 수 출력



// Test cases
print(solution([18, 24, 22, 48]))  // Output: 112
print(solution([14, 8, 8, 30, 1024]))  // Output: 1112
print(solution([6, 12, 12]))  // Output: 24
