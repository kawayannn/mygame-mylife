class GropupsController < ApplicationController
  before_action :set_gropup, only: [:show, :edit, :update, :destroy]

  # GET /gropups
  # GET /gropups.json
  def index
    @gropups = Gropup.all
  end

  # GET /gropups/1
  # GET /gropups/1.json
  def show
  end

  # GET /gropups/new
  def new
    @gropup = Gropup.new
  end

  # GET /gropups/1/edit
  def edit
  end

  # POST /gropups
  # POST /gropups.json
  def create
    @gropup = Gropup.new(gropup_params)

    respond_to do |format|
      if @gropup.save
        format.html { redirect_to @gropup, notice: 'Gropup was successfully created.' }
        format.json { render :show, status: :created, location: @gropup }
      else
        format.html { render :new }
        format.json { render json: @gropup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gropups/1
  # PATCH/PUT /gropups/1.json
  def update
    respond_to do |format|
      if @gropup.update(gropup_params)
        format.html { redirect_to @gropup, notice: 'Gropup was successfully updated.' }
        format.json { render :show, status: :ok, location: @gropup }
      else
        format.html { render :edit }
        format.json { render json: @gropup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gropups/1
  # DELETE /gropups/1.json
  def destroy
    @gropup.destroy
    respond_to do |format|
      format.html { redirect_to gropups_url, notice: 'Gropup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gropup
      @gropup = Gropup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gropup_params
      params.fetch(:gropup, {})
    end
end
