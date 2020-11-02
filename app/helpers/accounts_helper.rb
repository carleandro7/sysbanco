module AccountsHelper
    def listaAccountLogin
        @account = Account.where("accounts.id<>"+current_account.id.to_s).order(:nome)
    end
    def listaAccount
        @account = Account.order(:nome)
    end
end
