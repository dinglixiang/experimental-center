class HomeController < ApplicationController
  def index
  	@dorders = Dorder.pass.limit(6)
  	@sorders = Sorder.pass.limit(6)
  end
end
