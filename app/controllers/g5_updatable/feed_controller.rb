class G5Updatable::FeedController < ApplicationController
  def update
    G5Updatable::ClientFeedProcessor.new(params[:urn]).work
    render json: {}, status: :ok
  end
end
