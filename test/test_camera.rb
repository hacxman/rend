require 'test/unit'
require 'lib/objects'
require 'test/helpers'

class TestCamera < Test::Unit::TestCase
  def setup
  end

  def test_ray_creation
    c = Rend::Camera.new
    c.name = 'c0'
    c.pos  = [0, 0, 0]
    c.size = [3, 3]
    c.up   = [1, 0, 0]
    c.focal_point = [0, 0, -3]
    
    resolution = [2, 2]

    rays = c.create_rays(resolution)
    assert_equal 4, rays.size
    
    rorig = YAML::load("--- \n- !ruby/object:Rend::Ray \n  picture_pos: \n  - 0\n  - 0\n  pos: &id001 \n    - 0\n    - 0\n    - -3\n  vec: \n  - 0.0\n  - 0.0\n  - 3.0\n- !ruby/object:Rend::Ray \n  picture_pos: \n  - 0\n  - 1\n  pos: *id001\n  vec: \n  - -1.5\n  - 0.0\n  - 3.0\n- !ruby/object:Rend::Ray \n  picture_pos: \n  - 1\n  - 0\n  pos: *id001\n  vec: \n  - 0.0\n  - 1.5\n  - 3.0\n- !ruby/object:Rend::Ray \n  picture_pos: \n  - 1\n  - 1\n  pos: *id001\n  vec: \n  - -1.5\n  - 1.5\n  - 3.0\n")
    rorig.zip(rays).each do |a,b|
      assert_same_data a, b
    end

  end
end
