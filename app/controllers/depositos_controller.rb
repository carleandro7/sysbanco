class DepositosController < ApplicationController
  before_action :set_deposito, only: [:show]

  # GET /depositos
  # GET /depositos.json
  def index
    @depositos = Deposito.all
  end

  # GET /depositos/1
  # GET /depositos/1.json
  def show
  end

  # GET /depositos/new
  def new
    @deposito = Deposito.new
  end

  # POST /depositos
  # POST /depositos.json
  def create
    @deposito = Deposito.new(deposito_params)

    respond_to do |format|
      if @deposito.save
        format.html { redirect_to @deposito, notice: 'Deposito was successfully created.' }
        format.json { render :show, status: :created, location: @deposito }
      else
        format.html { render :new }
        format.json { render json: @deposito.errors, status: :unprocessable_entity }
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
