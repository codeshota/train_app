class Route < ApplicationRecord
  validates :name, presence: true

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  before_create :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end
end
