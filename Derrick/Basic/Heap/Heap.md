## Heap

```swift 
let number = 9
var heap = [7,6,5,8,3,5,9,1,6]

func heapify() {
    // 먼저 전체 트리 구조를 최대 힙 구조로 바꾼다.
    for i in 1..<number {
        var child = i

        repeat {
            let root = (child - 1) / 2

            if heap[root] < heap[child] {
                var temp = heap[root]
                heap[root] = heap[child]
                heap[child] = temp
            }

            child = root
        } while child != 0
    }

    // 크기를 줄여가며 반복적으로 힙을 구성한다.

    for i in stride(from: number - 1, to: 0, by: -1) {
        var temp = heap[0]
        heap[0] = heap[i] // 가장 첫 번째 값을 맨 뒤로 보낸다
        heap[i] = temp

        var root = 0
        var child = 1

        repeat {
            child = 2 * root + 1

            // 자식중에 더 큰 값을 찾기
            if (child < i - 1 && heap[child] < heap[child + 1]) {
                child += 1
            }

            // 루트보다 자식이 더 크다면 교환
            if (child < i && heap[root] < heap[child]) {
                var temp = heap[root]
                heap[root] = heap[child]
                heap[child] = temp
            }

            root = child
        } while child < i
    }

    for i in 0..<number {
        print(heap[i])
    }
}

heapify()

```