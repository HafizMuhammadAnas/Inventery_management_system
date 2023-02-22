class DashboardController < ApplicationController
	def index
	end
	def exported_files
		@exports = Export.all
	end
end
