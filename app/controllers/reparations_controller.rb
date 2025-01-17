class ReparationsController < ApplicationController
  before_action :set_reparation, only: %i[ show edit update destroy ]

  # GET /reparations or /reparations.json
  def index
    @reparations = Reparation.all

    @reps = @reparations.group_by{|m| m.created_at.beginning_of_month }
    @rep_per_year = @reparations.group_by { |y| y.created_at.beginning_of_year }.transform_values { |v| v.sum(&:price) }
    
  end

  # GET /reparations/1 or /reparations/1.json
  def show
  end

  # GET /reparations/new
  def new
    @reparation = Reparation.new
  end

  # GET /reparations/1/edit
  def edit
  end

  # POST /reparations or /reparations.json
  def create
    @reparation = Reparation.new(reparation_params)

    respond_to do |format|
      if @reparation.save
        format.html { redirect_to @reparation, notice: "Reparation was successfully created." }
        format.json { render :show, status: :created, location: @reparation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reparation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reparations/1 or /reparations/1.json
  def update
    respond_to do |format|
      if @reparation.update(reparation_params)
        format.html { redirect_to @reparation, notice: "Reparation was successfully updated." }
        format.json { render :show, status: :ok, location: @reparation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reparation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reparations/1 or /reparations/1.json
  def destroy
    @reparation.destroy!

    respond_to do |format|
      format.html { redirect_to reparations_path, status: :see_other, notice: "Reparation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reparation
      @reparation = Reparation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def reparation_params
      params.expect(reparation: [ :name, :probleme, :price ])
    end
end
