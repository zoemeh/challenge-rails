class ApplicationController < ActionController::Base
  before_action :set_view_count
  def set_view_count
    ViewCount.increment(request.path)
  end
end
