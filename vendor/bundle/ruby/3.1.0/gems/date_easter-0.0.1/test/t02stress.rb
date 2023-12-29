# t02stress.rb:  stress tests for date_easter
#
# This program is free software!  You can copy, modify, share and
# distribute it under the same license as Ruby itself.
#
# Rick Scott
# rick@shadowspar.dyndns.org
#
# Wed Nov 29 21:21:16 EST 2006
# 
# for rationale on choosing these dates, have a look at:
# http://en.wikipedia.org/wiki/Epoch_%28reference_date%29
# http://www.theiet.org/publicaffairs/scs/problemdates.cfm

require 'test/unit'
require 'date_easter'


class TC_Stress < Test::Unit::TestCase
  def test_year_rubbish
    assert_raise TypeError do
      Date::easter(nil)
    end

    assert_raise TypeError do
      Date::easter('asdf')
    end
  end

  def test_year_toobig
    assert_raise ArgumentError do
      Date::easter(9999)
    end

    ridiculous_future_date = Date.new(12345, 12, 31)

    assert_raise ArgumentError do
      ridiculous_future_date.easter() 
    end
  end

  def test_year_toosmall
    assert_raise ArgumentError do
      Date::easter(1)
    end

    ridiculous_ancient_date = Date.new(-1234, 12, 31)

    assert_raise ArgumentError do
      ridiculous_ancient_date.easter() 
    end
  end
end

