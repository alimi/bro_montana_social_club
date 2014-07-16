class SurveysController < ApplicationController
  def show
    @survey = Survey.active
  end
end
