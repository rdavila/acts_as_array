require 'test_helper'

class ActsAsArrayTest < ActiveSupport::TestCase
  load_schema

  class Preference < ActiveRecord::Base
    acts_as_array :colors
    acts_as_array :hobbies, :separator => '|'
  end

  def setup
    @preference = Preference.new
  end

  test 'return empty array by default' do
    assert_equal [], @preference.colors
  end

  test 'store value as simple string' do
    @preference.colors = ['red', 'green']
    assert_equal 'red,green', @preference.read_attribute(:colors)
  end

  test 'return array of values at reading' do
    @preference.colors = ['red', 'green']
    assert_equal ['red', 'green'], @preference.colors
  end

  test 'custom separator' do
    @preference.hobbies = ['movies, music', 'computers']
    assert_equal 'movies, music|computers', @preference.read_attribute(:hobbies)
  end
end
