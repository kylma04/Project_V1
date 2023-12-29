# encoding: utf-8
require File.expand_path(File.dirname(__FILE__)) + '/../test_helper'

# This file is generated by the Ruby Holiday gem.
#
# Definitions loaded: definitions/mx.yaml, definitions/northamericainformal.yaml
class MxDefinitionTests < Test::Unit::TestCase  # :nodoc:

  def test_mx
    assert_equal "Año nuevo", (Holidays.on(Date.civil(2007, 1, 1), [:mx], [:informal])[0] || {})[:name]

    assert_equal "Día de la Constitución", (Holidays.on(Date.civil(2007, 2, 5), [:mx], [:informal])[0] || {})[:name]

    assert_equal "Día del Trabajo", (Holidays.on(Date.civil(2007, 5, 1), [:mx], [:informal])[0] || {})[:name]

    assert_equal "Cinco de Mayo", (Holidays.on(Date.civil(2007, 5, 5), [:mx], [:informal])[0] || {})[:name]

    assert_equal "Grito de Dolores", (Holidays.on(Date.civil(2007, 9, 15), [:mx], [:informal])[0] || {})[:name]

    assert_equal "Día de la Independencia", (Holidays.on(Date.civil(2007, 9, 16), [:mx], [:informal])[0] || {})[:name]

    assert_equal "Todos los Santos", (Holidays.on(Date.civil(2007, 11, 1), [:mx], [:informal])[0] || {})[:name]

    assert_equal "Los Fieles Difuntos", (Holidays.on(Date.civil(2007, 11, 2), [:mx], [:informal])[0] || {})[:name]

    assert_equal "Día de la Revolución", (Holidays.on(Date.civil(2007, 11, 19), [:mx], [:informal])[0] || {})[:name]

    assert_equal "Navidad", (Holidays.on(Date.civil(2007, 12, 25), [:mx], [:informal])[0] || {})[:name]

    assert_equal "Groundhog Day", (Holidays.on(Date.civil(2013, 2, 2), [:us], [:informal])[0] || {})[:name]

    assert_equal "Valentine's Day", (Holidays.on(Date.civil(2013, 2, 14), [:us], [:informal])[0] || {})[:name]

    assert_equal "St. Patrick's Day", (Holidays.on(Date.civil(2013, 3, 17), [:us], [:informal])[0] || {})[:name]

    assert_equal "April Fool's Day", (Holidays.on(Date.civil(2013, 4, 1), [:us], [:informal])[0] || {})[:name]

    assert_equal "Earth Day", (Holidays.on(Date.civil(2013, 4, 22), [:us], [:informal])[0] || {})[:name]

    assert_equal "Mother's Day", (Holidays.on(Date.civil(2013, 5, 12), [:us], [:informal])[0] || {})[:name]

    assert_equal "Armed Forces Day", (Holidays.on(Date.civil(2013, 5, 18), [:us], [:informal])[0] || {})[:name]

    assert_equal "Father's Day", (Holidays.on(Date.civil(2013, 6, 16), [:us], [:informal])[0] || {})[:name]

    assert_equal "Halloween", (Holidays.on(Date.civil(2013, 10, 31), [:us], [:informal])[0] || {})[:name]

  end
end