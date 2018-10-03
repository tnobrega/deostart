class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :content]
  def home
  end

  def content
  end
end
