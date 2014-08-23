class AddAboutFundContributionsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :about_fund_contributions, :boolean
  end
end
