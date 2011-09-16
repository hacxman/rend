require 'test/unit'
require 'lib/loader'

class SceneLoaderTest < Test::Unit::TestCase
  def setup
    @loader = Rend::SceneLoader.new
  end

  def test_load_empty
    s = @loader.load "test/fixtures/empty.yaml"
    assert_equal Hash.new, s
  end

  def test_load_simple_scene
    s = @loader.load "test/fixtures/simple.yaml"
    cam0 = Rend::Camera.new
    cam0.name = 'cam0'; cam0.pos = [0, -5, 0]; cam0.size = [1,1]; cam0.up = [0,0,1]; cam0.focal_point = [0, -10, 0]
    sp0 = Rend::Sphere.new
    sp0.name = 's0'; sp0.pos = [0, 0, 0]; sp0.size = [1]

    assert_same_data s['cam0'], cam0
    assert_same_data s['s0'],   sp0
  end

  def cmp_instance i1, i2
    i1.instance_variables.each do |var|
      v1 = i1.instance_variable_get var
      v2 = i2.instance_variable_get var

      v1 == v2
    end.reduce {|a,b| a and b}
  end

  def assert_same_data i1, i2
    unless cmp_instance i1, i2
      assert_equal i1, i2
    else
      assert true
    end
  end

end
