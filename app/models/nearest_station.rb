class NearestStation < ApplicationRecord
  belongs_to :property
  validates :root, :station, :time, presence: true
end
