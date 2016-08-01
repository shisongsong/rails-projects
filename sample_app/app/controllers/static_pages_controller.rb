class StaticPagesController < ApplicationController
  http_basic_authenticate_with :name =>"shisong", :password => "shisong"
  def home
  end

  def help
  end

  def about
  end

  def contact
  end
end
