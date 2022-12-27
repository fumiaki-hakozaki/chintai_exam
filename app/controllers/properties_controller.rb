class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  before_action :set_nearest_stations, only: [:show, :edit, :update]
  # GET /properties or /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    @nearest_stations = @property.nearest_stations
  end

  # GET /properties/new
  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  # GET /properties/1/edit
  def edit
    @property.nearest_stations.build
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    # @nearest_stations = @property.nearest_stations
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: "物件を登録しました" }
        format.json { render :show, status: :created, location: @property }
      else
        2.times { @property.nearest_stations.build }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "編集をしました" }
        format.json { render :show, status: :ok, location: @property }
      else
        @property.nearest_stations.build
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "物件を削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

     def set_nearest_stations
      @nearest_stations = @property.nearest_stations
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:property_name, :rent, :address, :age, :note, nearest_stations_attributes: [:id, :root, :station, :time])
    end
end
