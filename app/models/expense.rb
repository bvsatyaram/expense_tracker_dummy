class Expense < ActiveRecord::Base
  attr_accessible :amount, :description

  # Validations
  validates :description, :presence => true
  validates :amount, :presence => true, :numericality => true
end
