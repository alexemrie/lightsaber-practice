class Lightsaber < ActiveRecord::Base
  validates :name, :presence => true
  validates :color, :presence => true

  def self.get_random_gif
    [1,2,3,4,5,6].sample
  end

end
