class Stack
    def initialize
      # creates ivar to store stack
      @stack = []
    end

    def push(el)
      # adds an element to the stack
      @stack.push(el)
    end

    def pop
      # removes one element from the stack
      @stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack.last
    end
end


class Queue
    def initialize
        # creates ivar to store queue
        @queue = []
    end

    def enqueue(el)
        # adds an element to the queue
        @queue.push(el)
    end

    def dequeue
        # removes one element from the queue using FIFO
        @queue.shift
    end

    def peek
        # returns but doesn't remove, the first element in the queue
        @queue.first
    end
end

class Map
    def initialize
        # creates ivar to store map
        @my_map = []
    end

    def set(key, value)
        # sets a key value pair in the map
        pair_index = @my_map.index { |pair| pair[0] == key }

        if pair_index
            @my_map[pair_index][1] = value
        else
            @my_map << [key, value]
        end
        
        [key, value]
    end

    def get(key)
        # returns the value(s) associated with the key in the map
        @my_map.each do |pair|
            return pair[1] if pair[0] == key
        end

        nil
    end

    def delete(key)
        # removes the key value pair from the map
        @my_map.each do |pair|
            return @my_map.delete([pair[0],pair[1]]) if pair[0] == key
        end

        nil
    end

    def show
        # Shows the map
        @my_map
    end
end