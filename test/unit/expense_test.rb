require_relative '../test_helper'

class ExpenseTest < ActiveSupport::TestCase
  def test_validate_description
    exp = Expense.new
    exp.amount = 10
    assert_false exp.valid?

    exp.description = "Description"
    assert exp.valid?
  end

  def test_validate_amount
    exp = Expense.new
    exp.description = "Description"
    assert_false exp.valid?

    exp.amount = "Amount"
    assert_false exp.valid?

    exp.amount = 20
    assert exp.valid?
  end
end
