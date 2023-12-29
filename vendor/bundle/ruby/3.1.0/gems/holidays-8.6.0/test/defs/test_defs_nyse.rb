# encoding: utf-8
require File.expand_path(File.dirname(__FILE__)) + '/../test_helper'

# This file is generated by the Ruby Holiday gem.
#
# Definitions loaded: definitions/nyse.yaml
class NyseDefinitionTests < Test::Unit::TestCase  # :nodoc:

  def test_nyse
    assert_equal "New Year's Day", (Holidays.on(Date.civil(2008, 1, 1), [:nyse])[0] || {})[:name]

    assert_equal "New Year's Day", (Holidays.on(Date.civil(2017, 1, 2), [:nyse], [:observed])[0] || {})[:name]
assert_equal "New Year's Day", (Holidays.on(Date.civil(2012, 1, 2), [:nyse], [:observed])[0] || {})[:name]
assert_equal "New Year's Day", (Holidays.on(Date.civil(2011, 1, 1), [:nyse], [:observed])[0] || {})[:name]
assert_equal "New Year's Day", (Holidays.on(Date.civil(2006, 1, 2), [:nyse], [:observed])[0] || {})[:name]

    assert_equal "Martin Luther King, Jr. Day", (Holidays.on(Date.civil(2008, 1, 21), [:nyse])[0] || {})[:name]

    assert_equal "Presidents' Day", (Holidays.on(Date.civil(2008, 2, 18), [:nyse])[0] || {})[:name]

    assert_equal "Good Friday", (Holidays.on(Date.civil(2008, 3, 21), [:nyse])[0] || {})[:name]

    assert_equal "Memorial Day", (Holidays.on(Date.civil(2008, 5, 26), [:nyse])[0] || {})[:name]

    assert_equal "Independence Day", (Holidays.on(Date.civil(2008, 7, 4), [:nyse])[0] || {})[:name]

    assert_equal "Labor Day", (Holidays.on(Date.civil(2008, 9, 1), [:nyse])[0] || {})[:name]

    assert_equal "Thanksgiving", (Holidays.on(Date.civil(2008, 11, 27), [:nyse])[0] || {})[:name]

    assert_equal "Christmas Day", (Holidays.on(Date.civil(2008, 12, 25), [:nyse])[0] || {})[:name]

    assert_equal "New Year's Day", (Holidays.on(Date.civil(2017, 1, 2), [:nyse], [:observed])[0] || {})[:name]
assert_equal "New Year's Day", (Holidays.on(Date.civil(2012, 1, 2), [:nyse], [:observed])[0] || {})[:name]
assert_equal "New Year's Day", (Holidays.on(Date.civil(2011, 1, 1), [:nyse], [:observed])[0] || {})[:name]
assert_equal "New Year's Day", (Holidays.on(Date.civil(2006, 1, 2), [:nyse], [:observed])[0] || {})[:name]

    assert_equal "Juneteenth National Independence Day", (Holidays.on(Date.civil(2022, 6, 20), [:nyse], [:observed])[0] || {})[:name]
assert_equal "Juneteenth National Independence Day", (Holidays.on(Date.civil(2023, 6, 19), [:nyse], [:observed])[0] || {})[:name]
assert_equal "Juneteenth National Independence Day", (Holidays.on(Date.civil(2024, 6, 19), [:nyse], [:observed])[0] || {})[:name]
assert_equal "Juneteenth National Independence Day", (Holidays.on(Date.civil(2027, 6, 18), [:nyse], [:observed])[0] || {})[:name]

    assert_nil (Holidays.on(Date.civil(2021, 6, 18), [:nyse], [:observed])[0] || {})[:name]

  end
end
