class Property < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations
  validates :property_name, :rent, :address, :age, presence: true
end
