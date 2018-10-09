class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :content, :privacy_policy, :startexperience]
  def home
  end

  def content
  end

  def privacy_policy
  end

  def startexperience
  end
end
