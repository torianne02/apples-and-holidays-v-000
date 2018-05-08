require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].keys.each do |holiday|
    holiday_hash[:winter][holiday] << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holidays|
    capitalized_season = season.to_s.capitalize! + ':'
    puts capitalized_season
    holidays.each do |holiday, supplies|
      holiday_array = holiday.to_s.split('_')
      holiday_array.each do |word|
        word.capitalize!
      end
      supply_array = []
        supplies.each do |supply|
          supply_array << supply
        end
      puts '  ' + holiday_array.join(' ') + ': ' + supply_array.join(', ')
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  array_of_bbq_holidays = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      supplies.each do |supply|
        if supply == "BBQ"
          array_of_bbq_holidays << holiday
        end
      end
    end
  end
  return array_of_bbq_holidays
end
