# class CommentsController < ApplicationController
#
#   before_action :authenticate_user! # authenticate before anyone can comment who is not logged in.
#   before_action :set_comment, only: [:edit, :update, :show, :destroy]
#   before_action :set_event
#   before_action :set_eventpost
#
#   def new
#     @comment = Comment.new
#   end
#
#   def create
#     @comment = @eventpost.comments.create(params[:comment].permit(:reply, :eventpost_id))
#     @comment.user_id = current_user.id
#
#     respond_to do |format|
#       if @comment.save
#         format.html { redirect_to eventpost_path(@eventpost) }
#         format.js # renders create.js.erb
#       else
#         format.html { redirect_to eventpost_path(@eventpost), notice: "Your comment did not save. Please try again." }
#         format.js
#       end
#     end
#   end
#
#   def destroy
#     @comment = @eventpost.comments.find(params[:id])
#     @comment.destroy
#     redirect_to eventpost_path(@eventpost)
#   end
#
#   private
#
#   def set_event
#     @event = Event.find(params[:event_id])
#   end
#
#   def set_eventpost
#     @eventpost = Eventpost.find(params[:eventpost_id])
#   end
#
#   def set_comment
#     @comment = Comment.find(params[:id])
#   end
#
#   def comment_params
#     params.require(:comment).permit(:reply)
#   end
#


#
#
# before_action :authenticate_user!
# before_action :set_comment, only: [:edit, :update, :show, :destroy]
# before_action :set_eventpost
#
#
# # GET /comments
# # GET /comments.json
# def index
#   @comments = Comment.all
# end
#
# # GET /comments/1
# # GET /comments/1.json
# def show
# end
#
# # GET /comments/new
# def new
#   @comment = Comment.new
# end
#
# # GET /comments/1/edit
# def edit
# end
#
# # POST /comments
# # POST /comments.json
# def create
#   @comment = Comment.new(comment_params)
#
#   respond_to do |format|
#     if @comment.save
#       format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
#       format.json { render :show, status: :created, location: @comment }
#     else
#       format.html { render :new }
#       format.json { render json: @comment.errors, status: :unprocessable_entity }
#     end
#   end
# end
#
# # PATCH/PUT /comments/1
# # PATCH/PUT /comments/1.json
# def update
#   respond_to do |format|
#     if @comment.update(comment_params)
#       format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
#       format.json { render :show, status: :ok, location: @comment }
#     else
#       format.html { render :edit }
#       format.json { render json: @comment.errors, status: :unprocessable_entity }
#     end
#   end
# end
#
# # DELETE /comments/1
# # DELETE /comments/1.json
# def destroy
#   @comment.destroy
#   respond_to do |format|
#     format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
#     format.json { head :no_content }
#   end
# end
#
#
# private
#
# # Use callbacks to share common setup or constraints between actions.
# def set_eventpost
#   @eventpost = Eventpost.find(params[:eventpost_id])
# end
#
# def set_comment
#   @comment = Comment.find(params[:id])
# end
#
# # Only allow a list of trusted parameters through.
# def comment_params
#   params.require(:comment).permit(:content)
# end
#
#


class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :show, :destroy]
  before_action :set_eventpost
  before_action :set_event


  # GET /eventposts
  # GET /eventposts.json
  def index
    # @eventposts = Eventpost.all.order("created_at DESC")
    @comment = Comment.new
  end

  #
  # # GET /eventposts/1
  # # GET /eventposts/1.json
  def show
    @comment = Comment.new
    @comments = Event.eventpost.comments.all.order("created_at DESC")

  end

  #
  # # GET /eventposts/new
  def new
    @comment = Comment.new
  end

  # GET /eventposts/1/edit
  def edit
  end

  # POST /eventposts
  # POST /eventposts.json
  def create

    @comment = @eventposts.comment.build(eventpost_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


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
    @comment = @event.eventpost.comment.find(params[:id])
    @comment.destroy
    redirect_to event_path(@eventpost)
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_eventpost
    @eventpost = Eventpost.find(params[:id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:eventpost).permit(:content)
  end


end
