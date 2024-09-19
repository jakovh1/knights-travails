require_relative './vertex'

def knight_moves(start_point, end_point)

  nodes_to_visit = [[start_point, nil]]
  path_found = false
  parents = {}
  path = [end_point]
  
  until path_found
    new_position = nodes_to_visit.shift

    # check whether current square is the last square of the path
    if new_position[0] == end_point
      parents[new_position[0]] = new_position[1] 
      path_found = true
      break
    end
    
    # Instantiate a new vertex(square) node to get access to all of its adjacents
    new_node = Vertex.new(new_position[0])
    new_node.next_moves.delete(new_node.position)

    # iterate through current square's adjacents and check whether any of them is end-square
    for move in new_node.next_moves

      if move == end_point
        parents[move] = new_node.position
        path_found = true
        break
      end

      nodes_to_visit.push([move, new_node.position]) unless parents.key?(move)
    end

    parents[new_position[0]] = new_position[1]

  end
  
  # by searching through parents dictionary, compose a path that leads from start to end square
  until path[0] == start_point
    path.unshift(parents[path[0]])
  end
  
  p path
  
end

knight_moves([1, 7], [7, 7])
