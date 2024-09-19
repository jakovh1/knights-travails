class Vertex
  attr_accessor :position, :next_moves

  def initialize(position)
    @position = position
    @next_moves = [calculate_position(@position, 2, 1),
                   calculate_position(@position, 1, 2),
                   calculate_position(@position, -1, 2),
                   calculate_position(@position, -2, 1),
                   calculate_position(@position, -2, -1),
                   calculate_position(@position, -1, -2),
                   calculate_position(@position, 1, -2),
                   calculate_position(@position, 2, -1)]
  end

  def calculate_position(start_position, new_row, new_column)
    new_position = [start_position[0] + new_row, start_position[1] + new_column]

    return new_position if new_position[0].between?(0, 7) && new_position[1].between?(0, 7)

    start_position
  end
end