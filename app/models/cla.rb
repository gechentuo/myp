class Cla < ActiveRecord::Base
	validates :name, uniqueness: true
	belongs_to :grade
end
