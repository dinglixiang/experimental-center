class HomeController < ApplicationController
  def index
  	@notices = Notice.all
  	@dorders = Dorder.pass.limit(8) || Dorder.return.limit(8)
  	@sorders = Sorder.pass.limit(8)
  end
end
