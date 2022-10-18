class Stack
    def initialize
      # create ivar to store stack here!
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
        # create ivar to store queue here
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