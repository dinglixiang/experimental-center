#encoding:utf-8
module Admin
  class SiteRequirementsController < AdminController
    def index
      @site_requirement = SiteRequirement.first
    end

    def new
      @site_requirement = SiteRequirement.new
    end

    def create
      @site_requirement = SiteRequirement.new(params[:site_requirement])
      if @site_requirement.save
        redirect_to admin_root_path,:notice => "场地要求添加成功！"
      else
        render :new
      end
    end
    
    def edit
      @site_requirement = SiteRequirement.first
    end
    
    def update
      @site_requirement = SiteRequirement.first
      if @site_requirement.update_attributes(params[:site_requirement])
        redirect_to admin_root_path,:notice => "场地要求更新成功！"
      else
        render :edit
      end
    end

  end
end

