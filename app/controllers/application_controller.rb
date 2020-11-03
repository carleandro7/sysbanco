class ApplicationController < ActionController::Base
    before_action :authenticate_account!

    #caso o usuario esteja logado 
    #redirecionar para pagina principal
    def redirecionar_usuario_logado
        if current_account != nil 
          redirect_to accounts_url
        end
    end

    def verificar_account_login(account)
        if account.id != current_account.id
          redirect_to root_url
        end
    end

    def extrato_data(datainicial, datafinal)
        account_id = current_account.id
        datainicial = (DateTime.parse(datainicial)).strftime("%Y-%m-%d 00:00:00")
        datafinal = (DateTime.parse(datafinal)+1.days).strftime("%Y-%m-%d 23:59:59.999999")
        saques = Saque.where('account_id = ? AND  created_at >= ? AND created_at <= ?',account_id, datainicial, datafinal)
        depositos = Deposito.where('account_id = ? AND  created_at > ? AND created_at < ?',account_id, datainicial, datafinal)
        transferaccounts = Transferaccount.where('account_id = ? AND  created_at >= ? AND created_at <= ?',account_id, datainicial, datafinal)
        ordenar(saques, depositos, transferaccounts,account_id)
    end

    
  
    private
      
    def ordenar(saques, depositos, transferaccounts, account_id)
        list = Array.new
        saques.each do |saque|
            list.push({"id"=> saque.id, "valor"=> saque.valor, "data"=>saque.created_at, "mensagem"=> "Saque"})
        end
        depositos.each do |deposito|
          list.push({"id"=> deposito.id,"valor"=> deposito.valor, "data"=>deposito.created_at, "mensagem"=> "Depósito"})
        end
        transferaccounts.each do |transferaccount|
            list.push({"id"=> transferaccount.transfer.id, "valor"=> transferaccount.transfer.valor, "data"=>transferaccount.transfer.created_at, "mensagem"=> transferaccount.operacao})
        end
        list = list.sort_by { |k| k["data"] }
    end

    def after_sign_out_path_for(resource_or_scope)
        menu_accounts_path
     end
     def after_sign_in_path_for(resource_or_scope)
       accounts_path
    end
end
