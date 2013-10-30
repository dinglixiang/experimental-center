class SitesController < ApplicationController
  def index
    @sites = Site.page(params[:page]).per(4)	
  end

  def requirement 
    @site_requirement = SiteRequirement.first
  end
end
