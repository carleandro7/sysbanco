class SaquesController < ApplicationController
  before_action :set_saque, only: [:show]

  # GET /saques
  # GET /saques.json
  def index
    @saques = Saque.all
  end

  # GET /saques/1
  # GET /saques/1.json
  def show
    if @saque.account_id != current_account.id
      redirecionar_usuario_logado
    end
  end

  # GET /saques/new
  def new
    @saque = Saque.new
  end

  # POST /saques
  # POST /saques.json
  def create
    ActiveRecord::Base.transaction do
      @saque = Saque.new(saque_params)
      @saque.account_id = current_account.id
      respond_to do |format|
        if @saque.save
          format.html { redirect_to @saque, notice: 'Saque was successfully created.' }
          format.json { render :show, status: :created, location: @saque }
        else
          format.html { render :new }
          format.json { render json: @saque.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saque
      @saque = Saque.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def saque_params
      params.require(:saque).permit(:valor, :account_id)
    end
end
