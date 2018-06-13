class Triangle
  attr_accessor :length1, :length2, :length3

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def legal
    if length1 <= 0 || length2 <= 0 || length3 <= 0
        raise TriangleError
    end
  end

  def doesnt_violate_triangle_equality(a,b,c)
    sorted = [a,b,c].sort
    greatest_side = sorted.pop
    if greatest_side >= sorted.inject(:+)
      raise TriangleError
    end
  end

  def kind
    legal
    doesnt_violate_triangle_equality(length1,length2, length3)
    if length1 == length2 && length2 == length3 && length1 == length3
      :equilateral
    elsif
      length1 == length2 || length2 == length3 || length1 == length3
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    puts "oh honey no"
  end

end
