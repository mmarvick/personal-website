module ProjectsHelper
  	def platform_projects(platform)
  		Project.where(platform: platform)
  	end	
end
