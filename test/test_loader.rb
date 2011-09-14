require 'test/unit'
require 'lib/loader'

class SceneLoaderTest < Test::Unit::TestCase
  def setup
    @loader = Rend::SceneLoader.new
  end

  def test_load_empty
    s = @loader.load "test/fixtures/empty.yaml"
    assert_equal s, []
  end

  def test_load_simple_scene
    s = @loader.load "test/fixtures/simple.yaml"
    p s
  end
end
