def sluggish_octopus(arr)
  #finds the longest string in arr in O(n^2) time
  longest_fish_idx = arr.index do |fish|
    arr.all? { |fish_2| fish.length >= fish_2.length }
  end

  arr[longest_fish_idx]
end

def dominant_octopus(arr)
  #finds longest string in O(n log n) time
  sorted_arr = merge_sort(arr)
  sorted_arr.last
end

def merge_sort(arr)
  # merge sort by string length
  return arr if arr.size <= 1
  middle = arr.size / 2
  left = merge_sort(arr.take(middle))
  right = merge_sort(arr.drop(middle))

  merge(left, right)
end

def merge(arr1, arr2)
  sorted = []
  until arr1.empty? || arr2.empty?
    if arr1.first.length < arr2.first.length
      sorted << arr1.shift
    else
      sorted << arr2.shift
    end
  end

  sorted + arr1 + arr2
end

def clever_octopus(arr)
  # finds longest string in O(n) time
  longest_fish = nil
  arr.each do |fish|
    if longest_fish.nil? || fish.length > longest_fish.length
      longest_fish = fish
    end
  end

  longest_fish
end

TILES_ARRAY = ["up", "right-up", "right", "right-down", "down",
               "left-down", "left", "left-up" ]

def slow_dance(dir, tile_array)
  # returns the index of a direction in the given array in O(n) time
  tile_array.each_with_index { |tile, i| return i if tile == dir }
end

TILES_HASH = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(dir, tiles_hash)
  # returns the index of a direction in O(1) time using a hash
  tiles_hash[dir]
end
