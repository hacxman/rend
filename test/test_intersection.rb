require 'test/unit'
require 'lib/objects'

class TestIntersection < Test::Unit::TestCase
  def setup
  end

  def test_sphere
    sp = Rend::Sphere.new
    sp.name = 's0'
    sp.pos  = [0, 0, 0]
    sp.size = 1

    # ax + b
    ray = Rend::Ray.new([0,0,-10], [0,0,1])
    # two point intersection
    p, t = sp.intersect_ray ray
    assert_equal 9, t
    assert_equal [0,0,-1], p

    # tangent
    sp.pos = [0, 1, 0]
    p, t = sp.intersect_ray ray
    assert_equal 10, t
    assert_equal [0,0,0], p

    # no intersection
    sp.pos = [5, 17, 10]
    p, t = sp.intersect_ray ray
    assert_equal nil, t
    assert_equal nil, p


  end
end
