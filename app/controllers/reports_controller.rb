class ReportsController < ApplicationController
  def index
    @reports = Profile.all.includes(:repositories)
    if params[:tag].present?
      @reports = @reports.where('LOWER(repositories.tags) LIKE ?', ActiveRecord::Base.sanitize_sql("%#{params[:tag]}%").downcase).references(:repositories)
    end
  end

  def external
    @reports = ReportService.new.generate
  end
end
