require 'rails_helper'

describe User do
  let(:user) do
    User.create! password: 'password', password_confirmation: 'password'
  end

  let(:survey) { Survey.create! active: true }

  let(:fund_contribution_question) do
    survey.questions.create! about_fund_contributions: true
  end

  let(:contribution_choice_one) do
    fund_contribution_question.choices.create!(
      text: 'Fund A',
      value: '5',
      value_type: 'float'
    )
  end

  let(:contribution_choice_two) do
    fund_contribution_question.choices.create!(
      text: 'Fund B',
      value: '10',
      value_type: 'float'
    )
  end

  let(:no_contribution_choice) do
    fund_contribution_question.choices.create!(
      text: 'No contribution',
      value: '0',
      value_type: 'float'
    )
  end

  context '#amount_of_annual_fund_contributions' do
    subject { user.amount_of_annual_fund_contributions }

    context 'when the the user has not answered any questions about annual fund contributions' do
      it 'is 0' do
        expect(subject).to be == 0
      end
    end

    context 'when the user has answered active Survey questions about fund contributions' do
      context 'and the user has choosen to make no fund contributions' do
        before do
          fund_contribution_question.responses.create!(
            user: user, choices: [no_contribution_choice])
        end

        it 'is 0' do
          expect(subject).to be == 0
        end
      end

      context 'and the user has choosen to make fund contributions' do
        before do
          fund_contribution_question.responses.create!(
            user: user,
            choices: [contribution_choice_one, contribution_choice_two]
          )
        end

        it 'is the sum of the chosen fund contributions' do
          expect(subject).to be == contribution_choice_one.value.to_f +
            contribution_choice_two.value.to_f
        end
      end
    end
  end
end
