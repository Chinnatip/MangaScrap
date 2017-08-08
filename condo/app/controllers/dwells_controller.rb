class DwellsController < ApplicationController
  before_action :set_dwell, only: [:show, :edit, :update, :destroy]

  # GET /dwells
  # GET /dwells.json
  def index
    @dwells = Dwell.all
  end

  # GET /dwells/1
  # GET /dwells/1.json
  def show
  end

  # GET /dwells/new
  def new
    @dwell = Dwell.new
  end

  # GET /dwells/1/edit
  def edit
  end

  # POST /dwells
  # POST /dwells.json
  def create
    @dwell = Dwell.new(dwell_params)

    respond_to do |format|
      if @dwell.save
        format.html { redirect_to @dwell, notice: 'Dwell was successfully created.' }
        format.json { render :show, status: :created, location: @dwell }
      else
        format.html { render :new }
        format.json { render json: @dwell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dwells/1
  # PATCH/PUT /dwells/1.json
  def update
    respond_to do |format|
      if @dwell.update(dwell_params)
        format.html { redirect_to @dwell, notice: 'Dwell was successfully updated.' }
        format.json { render :show, status: :ok, location: @dwell }
      else
        format.html { render :edit }
        format.json { render json: @dwell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dwells/1
  # DELETE /dwells/1.json
  def destroy
    @dwell.destroy
    respond_to do |format|
      format.html { redirect_to dwells_url, notice: 'Dwell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dwell
      @dwell = Dwell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dwell_params
      params.require(:dwell).permit(:name, :price, :lattitude, :longitude, :size, :cost_per_size, :type, :ref_id, :link)
    end
end
