class EventpostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_eventpost, only: [:edit, :update, :show, :destroy]
  before_action :set_event

  # GET /eventposts
  # GET /eventposts.json
  # def index
  #   @eventposts = Eventpost.all
  # end
  #
  # # GET /eventposts/1
  # # GET /eventposts/1.json
  # def show
  #
  # end
  #
  # # GET /eventposts/new
  def new
    @eventpost = Eventpost.new
  end

  # GET /eventposts/1/edit
  def edit
  end

  # POST /eventposts
  # POST /eventposts.json
  def create
    @eventpost = @event.eventposts.create(params[:eventpost].permit(:reply, :event_id))
    @eventpost.user_id = current_user.id

    respond_to do |format|
      if @eventpost.save
        format.html { redirect_to event_path(@event) }
        format.js # renders create.js.erb
      else
        format.html { redirect_to event_path(@event), notice: "Your eventpost did not save. Please try again." }
        format.js
      end
    end
  end
  #
  # def create
  #
  #   @eventpost = @event.eventposts.create(params[:eventpost].permit(:title, :content,  :event_id))
  #   @eventpost.user_id = current_user.id
  #
  #
  #   @eventpost = Eventpost.new(eventpost_params)
  #
  #   respond_to do |format|
  #     if @eventpost.save
  #       format.html { redirect_to @eventpost, notice: 'Eventpost was successfully created.' }
  #       format.json { render :show, status: :created, location: @eventpost }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @eventpost.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /eventposts/1
  # PATCH/PUT /eventposts/1.json
  # def update
  #   respond_to do |format|
  #     if @eventpost.update(eventpost_params)
  #       format.html { redirect_to @eventpost, notice: 'Eventpost was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @eventpost }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @eventpost.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /eventposts/1
  # DELETE /eventposts/1.json

  def destroy
    @eventpost = @event.eventposts.find(params[:id])
    @eventpost.destroy
    redirect_to event_path(@event)
  end


  private

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_eventpost
      @eventpost = Eventpost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def eventpost_params
      params.require(:eventpost).permit(:title, :content)
    end

end
