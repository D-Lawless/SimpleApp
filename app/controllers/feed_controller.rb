class FeedController < ApplicationController

  def index
    @events = Event.all.order("created_at DESC")
    @event = Event.new
  end

end
