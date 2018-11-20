module Dijkstrar
  class Distances

    def initialize(root)
      @root = root
      @cells = {}
      @cells[@root.id] = 0
    end

    def [](cell)
      @cells[cell.id]
    end

    def []=(cell, distance)
      @cells[cell.id] = distance
    end

    def cells
      @cells.keys
    end

    # def path_to(goal)
    #   current = goal
    #   recursive(goal, 1)
    #
    # end
    #
    # def recursive(cell, distance)
    #   cell.links.each do |neighbor|
    #     self[neighbor] = distance
    #     break if neighbor == @root
    #     recursive(neighbor, distance + 1)
    #   end
    # end


    def path_to(goal)
      current = goal
      breadcrumbs = Distances.new(@root)
      breadcrumbs[current] = self[current]
      until current == @root
        puts @cells
        current.links.each do |neighbor|
          begin
            if self[neighbor] < self[current]
              breadcrumbs[neighbor] = self[neighbor]
              current = neighbor
              break
            end
          rescue => e
            binding.pry
          end
        end
      end
      breadcrumbs
    end


    def max
      max_distance = 0
      max_cell = @root
      @cells.each do |cell, distance|
        if distance > max_distance
          max_cell = cell
          max_distance = distance
        end
      end
      [max_cell, max_distance]
    end
  end
end
