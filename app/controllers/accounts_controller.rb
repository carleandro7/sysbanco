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
    redirecionar_usuario_logado
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to action: "menu", notice: 'Account was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to action: "index", notice: 'Account was successfully updated.' }
       
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
