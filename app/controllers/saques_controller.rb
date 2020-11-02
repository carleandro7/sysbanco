class SaquesController < ApplicationController
  before_action :set_saque, only: [:show, :edit, :update, :destroy]

  # GET /saques
  # GET /saques.json
  def index
    @saques = Saque.all
  end

  # GET /saques/1
  # GET /saques/1.json
  def show
  end

  # GET /saques/new
  def new
    @saque = Saque.new
  end

  # GET /saques/1/edit
  def edit
  end

  # POST /saques
  # POST /saques.json
  def create
    @saque = Saque.new(saque_params)

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

  # PATCH/PUT /saques/1
  # PATCH/PUT /saques/1.json
  def update
    respond_to do |format|
      if @saque.update(saque_params)
        format.html { redirect_to @saque, notice: 'Saque was successfully updated.' }
        format.json { render :show, status: :ok, location: @saque }
      else
        format.html { render :edit }
        format.json { render json: @saque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saques/1
  # DELETE /saques/1.json
  def destroy
    @saque.destroy
    respond_to do |format|
      format.html { redirect_to saques_url, notice: 'Saque was successfully destroyed.' }
      format.json { head :no_content }
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
