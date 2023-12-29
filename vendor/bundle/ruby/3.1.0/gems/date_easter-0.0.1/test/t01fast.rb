# t01fast.rb:  abbreviated test suite for date_easter
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


class TC_Correctness < Test::Unit::TestCase
  def test_correctness
    test_dates = %w{
      10 04 1583
      01 04 1584
      07 04 1602
      02 04 1752

      04 04 1858
      02 04 1899
      15 04 1900
      07 04 1901
      03 04 1904

      06 04 1969
      29 03 1970
      11 04 1971
      10 04 1977
      26 03 1978
      15 04 1979
      06 04 1980

      19 04 1981
      11 04 1982
      03 04 1983
      22 04 1984
      07 04 1985
      30 03 1986
      19 04 1987
      03 04 1988
      26 03 1989
      15 04 1990
      
      31 03 1991
      19 04 1992
      11 04 1993
      03 04 1994
      16 04 1995
      07 04 1996
      30 03 1997
      12 04 1998
      04 04 1999
      23 04 2000
      
      15 04 2001
      31 03 2002
      20 04 2003
      11 04 2004
      27 03 2005
      16 04 2006
      08 04 2007
      23 03 2008
      12 04 2009
      04 04 2010
      
      24 04 2011
      08 04 2012
      31 03 2013
      20 04 2014
      05 04 2015
      27 03 2016
      16 04 2017
      01 04 2018
      21 04 2019
      12 04 2020
      
      04 04 2021
      17 04 2022
      09 04 2023
      31 03 2024
      20 04 2025
      05 04 2026
      28 03 2027
      16 04 2028
      01 04 2029
      21 04 2030
      
      13 04 2031
      28 03 2032
      17 04 2033
      09 04 2034
      25 03 2035
      13 04 2036
      05 04 2037
      25 04 2038
      10 04 2039
      01 04 2040
      
      21 04 2041
      06 04 2042
      29 03 2043
      17 04 2044
      09 04 2045
      25 03 2046
      14 04 2047
      05 04 2048
      18 04 2049
      10 04 2050
      
      18 04 2060
      30 03 2070
      07 04 2080
      16 04 2090
      12 04 2099
      28 03 2100
      17 04 2101

      06 04 4098
      19 04 4099
    }

    until test_dates.empty?  
      day   = test_dates.shift.to_i
      month = test_dates.shift.to_i
      year  = test_dates.shift.to_i

      easter_date = Date::easter(year) 
      assert_equal(year,  easter_date.year,  "Year of Easter #{year}" )
      assert_equal(month, easter_date.month, "Month of Easter #{year}") 
      assert_equal(day,   easter_date.day ,  "Day of Easter #{year}"  )
    end
  end
end

