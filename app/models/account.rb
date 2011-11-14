class Account < ActiveRecord::Base

  validates_presence_of :type, :name

  has_many :credit_transactions,  :class_name => "Transaction", :foreign_key => "credit_account_id"
  has_many :debit_transactions,  :class_name => "Transaction", :foreign_key => "debit_account_id"
#make trail Balanace 
  def self.trial_balance
    unless self.new.class == Account
      raise(NoMethodError, "undefined method 'trial_balance'")
    else
      Asset.balance - (Liability.balance + Equity.balance + Revenue.balance - Expense.balance)
    end
  end

end

