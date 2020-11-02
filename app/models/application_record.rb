class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def saque_conta(account, valor_extra=0)
    if not(account.veririficar_saldo_suficiente(self.valor))
      errors.add(:base, "Saldo insuficiente em Conta!")
      throw(:abort)
    else
      account.saldo= account.saldo - (self.valor+valor_extra)
      account.update_columns({:saldo => account.saldo})
    end
  end

end
