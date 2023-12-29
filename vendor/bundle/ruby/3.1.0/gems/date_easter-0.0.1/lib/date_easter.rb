# date_easter:  calculate the day upon which Easter Sunday falls
#
# This program is free software!  You can copy, modify, share and
# distribute it under the same license as Ruby itself.
#
# Rick Scott
# rick@shadowspar.dyndns.org
#
# Tue Nov 28 22:57:01 EST 2006
# 
# 
# == Overview 
#
# This module calculates the date upon which Easter falls, a date
# upon which many holidays in the Western world depend.  
# It extends the Date class available in the Ruby standard library,
# adding the class method Date::easter(year) and the instance
# method easter().  It returns the correct date of Easter Sunday for 
# the Gregorian calendar years 1583 to 4099.
# 
# == Background 
# 
# Determining when Easter falls is a somewhat arcane process,
# largely due to the numerous adjustments that have been made to
# the Gregorian calendar in an attempt to `fit together' the
# cycles of the sun, moon, and earth.  Detailed discussion here
# would be somewhat pointless in light of the far superior
# resources available online -- see 'References', below, for some
# starting points.
#
# == References
# 
# http://en.wikipedia.org/wiki/Computus
# http://www.phys.uu.nl/~vgent/easter/easter_text2a.htm
# http://users.chariot.net.au/~gmarts/eastcalc.htm



require 'date'

class Date

  # :call-seq: 
  #   Date::easter(year)    => easter_sunday_Date
  #
  # Return the Date upon which Easter Sunday falls in _year_.
  # The Gregorian calendar is used.
  def self.easter(year) 
    unless year.is_a? Numeric
      raise TypeError, "year must be Numeric" 
    end

    if year < 1583 
      raise ArgumentError, "Years before 1583 not supported"  
    elsif year > 4099
      raise ArgumentError, "Years after 4099 not supported"  
    end

    golden_number     = (year % 19) + 1
    century           = (year / 100) + 1
    julian_epact      = (11 * (golden_number -1)) % 30 
    solar_correction  = (3 * century) / 4
    lunar_correction  = ((8 * century) + 5) / 25
  
    gregorian_epact   = 
        (julian_epact - solar_correction + lunar_correction + 8) % 30
  
    days_fm_ve_to_pfm = (23 - gregorian_epact) % 30

    if gregorian_epact == 24 or gregorian_epact == 25 && golden_number > 11
      days_fm_ve_to_pfm -= 1 
    end

    vernal_equinox    = Date.new(year, 3, 21) 
    paschal_full_moon = vernal_equinox + days_fm_ve_to_pfm
  
    days_to_sunday    = 7 - paschal_full_moon.wday
  
    easter_sunday     = paschal_full_moon + days_to_sunday
  end
  

  # :call-seq: 
  #   ref.easter()    => easter_sunday_Date
  #
  # Return the Date of Easter Sunday for the year in which _ref_
  # falls.  The Gregorian calendar is used.
  def easter
    Date::easter(self.year)
  end
end
