class Choice < ActiveRecord::Base
  enum value_type: [ :string, :float ]

  def value
    if float?
      super.to_f
    else
      super
    end
  end
end
