class VolunteerResourcesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user!
  before_action :check_admin!, except: [:file]
  before_action :set_volunteer_resource, only: [:show, :edit, :update, :destroy, :file]

  def file
    if @volunteer_resource.file.size > 0
      send_file File.join(CarrierWave::Uploader::Base.root.call(), @volunteer_resource.file.url)
    else
      head :ok
    end
  end

  # GET /volunteer_resources
  # GET /volunteer_resources.json
  def index
    @volunteer_resources = VolunteerResource.all
  end

  # GET /volunteer_resources/1
  # GET /volunteer_resources/1.json
  def show
  end

  # GET /volunteer_resources/new
  def new
    @volunteer_resource = VolunteerResource.new
  end

  # GET /volunteer_resources/1/edit
  def edit
  end

  # POST /volunteer_resources
  # POST /volunteer_resources.json
  def create
    @volunteer_resource = VolunteerResource.new(volunteer_resource_params)

    respond_to do |format|
      if @volunteer_resource.save
        format.html { redirect_to @volunteer_resource, notice: 'Volunteer resource was successfully created.' }
        format.json { render :show, status: :created, location: @volunteer_resource }
      else
        format.html { render :new }
        format.json { render json: @volunteer_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volunteer_resources/1
  # PATCH/PUT /volunteer_resources/1.json
  def update
    respond_to do |format|
      if @volunteer_resource.update(volunteer_resource_params)
        format.html { redirect_to @volunteer_resource, notice: 'Volunteer resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @volunteer_resource }
      else
        format.html { render :edit }
        format.json { render json: @volunteer_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteer_resources/1
  # DELETE /volunteer_resources/1.json
  def destroy
    @volunteer_resource.destroy
    respond_to do |format|
      format.html { redirect_to volunteer_resources_url, notice: 'Volunteer resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer_resource
      @volunteer_resource = VolunteerResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_resource_params
      params.require(:volunteer_resource).permit(:file, :title, :description)
    end
end
