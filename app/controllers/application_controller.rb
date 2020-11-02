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

    private 
    def after_sign_out_path_for(resource_or_scope)
        menu_accounts_path
     end
     def after_sign_in_path_for(resource_or_scope)
       accounts_path
    end
end
