require 'test/unit'
require 'lib/loader'
require 'test/helpers'

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


end
