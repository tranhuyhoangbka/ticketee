class Project < ActiveRecord::Base
	validates :name, presence: true

	paginates_per 8
end
