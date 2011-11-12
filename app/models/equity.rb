class Equity < Account
  def credits_balance
    credits_balance = BigDecimal.new('0')
    credit_transactions.each do |credit_transaction|
      credits_balance = credits_balance + credit_transaction.amount
    end
    return credits_balance
  end
  def debits_balance
    debits_balance = BigDecimal.new('0')
    debit_transactions.each do |debit_transaction|
      debits_balance = debits_balance + debit_transaction.amount
    end
    return debits_balance
  end
  def balance
    unless contra
      credits_balance - debits_balance
    else
      debits_balance - credits_balance
    end
  end
  def self.balance
    accounts_balance = BigDecimal.new('0')
    accounts = self.find(:all)
    accounts.each do |equity|
      unless equity.contra
        accounts_balance += equity.balance
      else
        accounts_balance -= equity.balance
      end
    end
    accounts_balance
  end
end

