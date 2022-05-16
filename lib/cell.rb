# frozen_string_literal: true

class Cell
  def initialize
    @is_alive = false
  end

  def next_state(alive_neighbours)
    first_rule(alive_neighbours)
    second_rule(alive_neighbours)
    third_rule(alive_neighbours)
    fourth_rule(alive_neighbours)
  end

  def first_rule(alive_neighbours_count)
    kill if alive_neighbours_count < 2
  end

  def second_rule(alive_neighbours_count)
    kill if alive_neighbours_count > 3
  end

  def third_rule(alive_neighbours_count)
    return if @is_alive == false

    vivify if [2, 3].include?(alive_neighbours_count)
  end

  def fourth_rule(alive_neighbours_count)
    vivify if alive_neighbours_count == 3
  end

  def alive?
    @is_alive
  end

  def dead?
    !alive?
  end

  def kill
    @is_alive = false
  end

  def vivify
    @is_alive = true
  end

  def copy
    Cell.new(@is_alive)
  end
end
