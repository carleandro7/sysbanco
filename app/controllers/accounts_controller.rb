class AccountsController < ApplicationController
  before_action :authenticate_account!, except: [:new, :create, :menu]
  before_action :set_account, only: [:show, :edit, :update]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  def menu
    redirecionar_usuario_logado
  end

  def extratoconta
    if params[:datainicial] != nil and params[:datafinal] != nil and params[:datainicial] != "" and params[:datafinal] != ""
      @datainicial=DateTime.parse(params[:datainicial].to_s).strftime("%Y-%m-%d")
      @datafinal=DateTime.parse(params[:datafinal].to_s).strftime("%Y-%m-%d")
    else
        @datainicial = (DateTime.now - 7.days).strftime("%Y-%m-%d")
        @datafinal = (DateTime.now).strftime("%Y-%m-%d")
    end
    @extrato_list = extrato_data(@datainicial, @datafinal)
  end

  def encerrarconta
    ActiveRecord::Base.transaction do
      @account = Account.find(current_account.id)
      @account.update_columns({:status => "Desativada"})
      sign_out
      redirect_to menu_accounts_path 
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    redirecionar_usuario_logado
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
    verificar_account_login(@account)
  end

  # POST /accounts
  # POST /accounts.json
  def create
    ActiveRecord::Base.transaction do
      redirecionar_usuario_logado
      @account = Account.new(account_params)

      respond_to do |format|
        if @account.save
          format.html { redirect_to action: "menu"}
        else
          format.html { render :new }
          format.json { render json: @account.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to action: "index" }
       
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:nome, :telefone, :cpf, :saldo, :status, :email, :password)
    end
end
