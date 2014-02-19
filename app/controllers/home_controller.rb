class HomeController < ApplicationController
  def index
  	@notices = Notice.all
  	@dorders = Dorder.published.limit(8) || Dorder.return.limit(8)
  	@sorders = Sorder.published.limit(8)
  end
end
