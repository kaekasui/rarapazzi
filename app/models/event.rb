class Event < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  belongs_to :brand
  has_many :photos
end
