class SitesController < ApplicationController
  def index
    @sites = Site.all	
  end

  def requirement 
    @site_requirement = SiteRequirement.first
  end
end
