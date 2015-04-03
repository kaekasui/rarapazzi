class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @brand = Brand.find(params[:brand_id])
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @brand = Brand.find(params[:brand_id])
    @hoge = Instagram.location_search(@event.latitude, @event.longitude)
  end

  # GET /events/new
  def new
    @brand = Brand.find(params[:brand_id])
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @brand = Brand.find(params[:brand_id])
  end

  # POST /events
  # POST /events.json
  def create

    @brand = Brand.find(params[:brand_id])
    @event = @brand.events.build(event_params)

    respond_to do |format|
      if @event.save
        @Insta = Instagram.location_search(@event.latitude, @event.longitude)
        @Insta.each do |h|
          Instagram.location_recent_media(h.id, {min_timestamp: (@event.datetime.to_i).to_s, max_timestamp: (@event.datetime.to_i + @event.timespan.to_i*60*60).to_s} ).each do |media|
            @photo =@event.photos.build(image_url: media.images.low_resolution.url, link: media.link)
            if @photo.save
            else
              raise
            end
          end
        end

        format.html { redirect_to brand_event_path(@brand,@event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:timespan, :latitude, :longitude, :address, :description, :title, :datetime)
    end
end
