# Chess Knight Pathfinder
## Summary
Breadth-First Search of polytree nodes to determine the shortest path a chess knight can take to get from a starting point to a given endpoint.

## Classes
- PolyTreeNode. This class allows us to define each possible move a knight can make as a node with its own children (possible moves from that spot).
- KnightPathFinder. This class builds the move tree of all possible moves a knight can make from a given starting point. It also provides methods to identify when the knight reaches a given endpoint and to provide the knight's path, tracing back through each node's parent until it reaches the starting point (which is the root node without any parent). 

## Other notes
Although the KnightPathFinder traceback method currently relies on a breadth-first search algorithm to find the path from starting point to end point, a depth-first search is also available in the PolyTreeNode class. The BFS algorithm method can easily be swapped out in favor of the DFS algorithm method. 
