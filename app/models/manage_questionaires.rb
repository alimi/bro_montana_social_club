class ManageQuestionaires
  def next_task
  end

  def template
    "years/manage_questionaires"
  end

  def template_data
    { questionaires: questionaires }
  end

  private

  def questionaires
    create_missing_questionaires
    year.questionaires.order(:member_id)
  end

  def create_missing_questionaires
    members_without_questionaires = Member.joins("
      LEFT OUTER JOIN questionaires
      ON questionaires.member_id = members.id
      AND questionaires.year_id = #{year.id}
      WHERE questionaires.id IS NULL
    ")

    members_without_questionaires.each do |member|
      member.questionaires.create!(year: year, token: SecureRandom.uuid)
    end
  end

  def members_without_questionaires
    Member.
      left_outer_joins(:questionaires).
      where(questionaires: { id: nil, year: year })
  end

  def year
    @year ||= CurrentYear.find
  end
end
