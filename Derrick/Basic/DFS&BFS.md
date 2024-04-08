## DFS

```swift 
func dfs(_ now: Int) {
	check[now] = true
	result += "\(now)"
	
	for i in graph[now] {
		if !check[i] {
			dfs(i)
		}
	}
}

func DFS(_ graph: [Int: [Int]], _ start: Int ) -> [Int]{

    var visited = [Int]()
    var stack = [start]

    while stack.count != 0 {
        let node = stack.popLast()!
        if visited.contains(node) {
            continue
        } else {
            visited.append(node)
            if let nodeWay = graph[node] {
                stack += nodeWay
            }
        }
    }
    return visited
}

func dfs(_ graph: [Int: [Int]], _ start: Int) -> [Int] {
	var visited = [Int]()
	var queue = [start]
	
	while stack.count != 0 {
		let node = queue.removeFirst()
		
		if visited.contains(node) {
			continue
		} else {
			visited.apped(node)
			if let nodeWay = graph[node] {
				queue += nodeWay
			}			
		}
	}
	
	return visited
}
```


## BFS

```swift 
func bfs(_ now: Int) {
	var needVisted: [Int] = [now]
	var visited = [Int]()
	
	while !needVisited.isEmpty {
		let node = needVisited.removeFirst()
		
		if !visited.contains(node) {
			visited.append(node)
			result += "\(node)"
			needVisited.apped(contentOf: graph[node].sorted()
		}
	}
}

func BFS(_ graph: [Int: [Int]], _ start: Int) -> [Int]{
    var visited = [Int]()
    var queue = [start]

    while queue.count != 0 {
        let node = queue.remove(at: 0)
        if visited.contains(node){
            continue
        } else {
            visited.append(node)
            if let nodeWay = graph[node] {
                queue += nodeWay
            }
        }
    }
    return visited
}

func bfs(_ graph: [Int: [Int]], _ start: Int) -> [Int] {
	var visited = [Int]()
	var queue = [start] 
	
	while queue.count != 0 {
		let node = queue.removeFirst()
		
		if visited.contains(node) {
			continue
		} else {
			visited.apped(node)
			
			if let nodeWay = graph[node] { 
				queue += nodeWay
			}
		}
	}
}

```