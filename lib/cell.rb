class Cell
  def initialize()
    @is_alive = false
  end

  def next_state(alive_neighbours)
    first_rule(alive_neighbours)
    second_rule(alive_neighbours)
    third_rule(alive_neighbours)
    fourth_rule(alive_neighbours)
  end

    def first_rule(alive_neighbours_count)
      if alive_neighbours_count < 2
        kill
      end
    end

    def second_rule(alive_neighbours_count)
      if alive_neighbours_count > 3
        kill
      end
    end

    def third_rule(alive_neighbours_count)
      if @is_alive == false
        return
      end
      if alive_neighbours_count == 2 || alive_neighbours_count == 3
        vivify
      end
    end

    def fourth_rule(alive_neighbours_count)
      if alive_neighbours_count == 3
        vivify
      end
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
end
