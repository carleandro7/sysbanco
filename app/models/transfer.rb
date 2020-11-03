class Transfer < ApplicationRecord
    has_many :transferaccounts, inverse_of: :transfer
    accepts_nested_attributes_for :transferaccounts, reject_if: :all_blank, allow_destroy: true
  
    before_save :validar_operacao
    validates_presence_of :valor
    
    
    def validar_operacao
      account = Account.find_by_id(self.transferaccounts[1].account_id)
      self.transferaccounts[0].operacao = "Transferência Recebida"
      self.transferaccounts[1].operacao = "Transferência Enviada" 
      transferencia_conta(account)
    end

    private 
  
    def transferencia_conta(account)
      if not(self.transferaccounts.empty?)
        self.taxa = calcular_taxa(self.valor)
        account_favorecido = Account.find_by_id(self.transferaccounts[0].account_id)
        saque_conta(account, self.taxa)
        deposita_conta(account_favorecido)
      end
    end

    def calcular_taxa(valor)
        hora_atual = Time.now
        dia_semana = hora_atual.strftime("%w")
        hora_9 = Time.parse('9:00:00')
        hora_18 = Time.parse('18:00:00')
        taxa = 0
        if (dia_semana != 0 and dia_semana!=6) and (hora_atual>= hora_9 and hora_atual<=hora_18)
          taxa = taxa + 5
        else
          taxa = taxa + 7
        end
        if valor > 1000
          taxa = taxa + 10
        end
        return taxa
    end
end
