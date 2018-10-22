require "rubygems"
require 'yaml'
require "test/unit"
require_relative 'valera.rb'
require_relative 'state.rb'
require_relative 'actions.rb'
require_relative 'view.rb'

class MyTest < Test::Unit::TestCase
  def setup
	@valera = Valera.new
    @actions = Actions.new
    @actions.init
  end

  def test_01_go_to_work
    @valera.vivacity = 10
    @valera.mana = 50
    @valera.money = 20
    @valera.tiredness = 10

    @actions.go_to_work(@valera)

    assert_equal 9, @valera.vivacity
    assert_equal 20, @valera.mana
    assert_equal 120, @valera.money
    assert_equal 80, @valera.tiredness
  end

  def test_02_contemplate_nature
    @valera.vivacity = 8
    @valera.mana = 50
    @valera.tiredness = 10

    @actions.contemplate_nature(@valera)

    assert_equal 9, @valera.vivacity
    assert_equal 40, @valera.mana
    assert_equal 20, @valera.tiredness
  end

  def test_03_drink_vine_and_watch_serials
    @valera.vivacity = 10
    @valera.mana = 50
    @valera.tiredness = 10
    @valera.health = 90
    @valera.money = 70

    @actions.drink_vine_and_watch_serials(@valera)

    assert_equal 9, @valera.vivacity
    assert_equal 80, @valera.mana
    assert_equal 20, @valera.tiredness
    assert_equal 85, @valera.health
    assert_equal 50, @valera.money
  end

  def test_04_go_to_bar
    @valera.vivacity = 5
    @valera.mana = 0
    @valera.tiredness = 10
    @valera.health = 90
    @valera.money = 120

    @actions.go_to_bar(@valera)

    assert_equal 6, @valera.vivacity
    assert_equal 60, @valera.mana
    assert_equal 50, @valera.tiredness
    assert_equal 80, @valera.health
    assert_equal 20, @valera.money
  end

  def test_05_drink_with_other_marginal_people
    @valera.vivacity = 5
    @valera.mana = 0
    @valera.tiredness = 10
    @valera.health = 90
    @valera.money = 900

    @actions.drink_with_other_marginal_people(@valera)

    assert_equal 10, @valera.vivacity
    assert_equal 90, @valera.mana
    assert_equal 90, @valera.tiredness
    assert_equal 10, @valera.health
    assert_equal 750, @valera.money
  end

  def test_06_sing_in_subway
    @valera.vivacity = 5
    @valera.mana = 0
    @valera.tiredness = 10
    @valera.money = 200

    @actions.sing_in_subway(@valera)

    assert_equal 6, @valera.vivacity
    assert_equal 10, @valera.mana
    assert_equal 30, @valera.tiredness
    assert_equal 210, @valera.money
  end

  def test_07_sing_in_subway_drunk
    @valera.vivacity = 5
    @valera.mana = 50
    @valera.tiredness = 10
    @valera.money = 200

    @actions.sing_in_subway(@valera)

    assert_equal 6, @valera.vivacity
    assert_equal 60, @valera.mana
    assert_equal 30, @valera.tiredness
    assert_equal 260, @valera.money
  end

  def test_08_sleep
    @valera.health = 5
    @valera.vivacity = 9
    @valera.mana = 20
    @valera.tiredness = 90
    

    @actions.sleep(@valera)

    assert_equal 95, @valera.health
    assert_equal 9, @valera.vivacity
    assert_equal 0, @valera.mana
    assert_equal 20, @valera.tiredness
  end

  def test_09_sleep_drunk
    @valera.health = 5
    @valera.vivacity = 9
    @valera.mana = 60
    @valera.tiredness = 90

	@actions.sleep(@valera)
    
    assert_equal 5, @valera.health
    assert_equal 9, @valera.vivacity
    assert_equal 10, @valera.mana
    assert_equal 20, @valera.tiredness
  end

  def test_10_sleep_very_drunk
    @valera.health = 5
    @valera.vivacity = 5
    @valera.mana = 80
    @valera.tiredness = 90

    @actions.sleep(@valera)

	assert_equal 5, @valera.health
    assert_equal 5, @valera.vivacity
    assert_equal 30, @valera.mana
    assert_equal 20, @valera.tiredness
  end
end
