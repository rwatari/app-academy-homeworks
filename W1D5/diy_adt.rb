class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    idx = index(key)
    idx ? @map[idx][1] = value : @map << [key, value]
  end

  def lookup(key)
    idx = index(key)
    idx ? @map[idx][1] : nil
  end

  def remove(key)
    idx = index(key)
    @map.delete_at(idx) if idx
  end

  def show
    @map.map(&:dup)
  end

  private

  def index(key)
    @map.find_index { |k, _| k == key }
  end
end
