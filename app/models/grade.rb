class Grade < ActiveRecord::Base
	belongs_to :school
	has_many :clas
end
