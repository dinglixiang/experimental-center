class RulesController < ApplicationController
  def index
    @rule = Rule.first
  end
end
