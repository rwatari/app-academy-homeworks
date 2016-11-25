class LRUCache
  # Simple implementation of LRU Cache using arrays
  def initialize(size)
    @cache = []
    @size = size
  end

  def count
    @cache.size
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
    elsif count == @size
      @cache.shift
    end

    @cache << el
    el
  end

  def show
    p @cache
  end
end
