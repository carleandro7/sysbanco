class DepositosController < ApplicationController
  before_action :authenticate_account!, except: [:new,:show, :create]
  before_action :set_deposito, only: [:show]

  # GET /depositos
  # GET /depositos.json
  def index
    @depositos = Deposito.all
  end

  # GET /depositos/1
  # GET /depositos/1.json
  def show
    if session[:deposito_show_id].to_s != ""
      @deposito = Deposito.find(session[:deposito_show_id])
    else
      redirect_to menu_accounts_path
    end
  end

  # GET /depositos/new
  def new
    @deposito = Deposito.new
  end

  # POST /depositos
  # POST /depositos.json
  def create
    ActiveRecord::Base.transaction do
      @deposito = Deposito.new(deposito_params)

      respond_to do |format|
        if @deposito.save
          session[:deposito_show_id] = @deposito.id
          format.html { redirect_to @deposito}
        else
          format.html { render :new }
          format.json { render json: @deposito.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deposito
      @deposito = Deposito.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deposito_params
      params.require(:deposito).permit(:valor, :account_id)
    end
end
