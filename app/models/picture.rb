class Picture < ApplicationRecord
  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.created_year(year)
    Picture.where("created_at LIKE ?", "#{year}%")
  end

  def self.years
    year_values = {}
    years = Picture.pluck(:created_at).map! {|date|
      date.year
    }.uniq!.sort!.reverse!
    years.each {|year|
      year_values[year] =  self.created_year(year)
    }
    return year_values
  end
end
