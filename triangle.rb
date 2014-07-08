# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb

def three_sides_equal?(sides)
  sides.each_cons(2).all?{|x, y| x == y}
end

def two_sides_equal?(sides)
  sides.each_cons(2).any?{|x, y| x == y}
end

def any_non_positive?(sides)
  sides.any?{|x| x <= 0}
end

def degenerate?(sides)
  sides.each_cons(3).any?{|x, y, z| x + y <= z}
end

def triangle(a, b, c)
  sides = [a, b, c].cycle(2)
  if any_non_positive?(sides)
    raise TriangleError.new('Sides must be positive')
  end
  if degenerate?(sides)
    raise TriangleError.new('Triangle must not be degenerate')
  end
  if three_sides_equal?(sides)
    return :equilateral
  end
  if two_sides_equal?(sides)
    return :isosceles
  end
  :scalene
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
