class StaticPagesController < ApplicationController
  skip_before_filter :authorize

  def home
  end
end
