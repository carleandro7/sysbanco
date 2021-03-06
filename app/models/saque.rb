class Saque < ApplicationRecord
  belongs_to :account
  before_save :validar_operacao
  validates_presence_of :valor, :account_id
  
  def validar_operacao
    account = Account.find_by_id(self.account_id)
    saque_conta(account)
  end
end
