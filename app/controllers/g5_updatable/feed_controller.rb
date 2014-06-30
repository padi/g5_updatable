class G5Updatable::FeedController < ApplicationController
  def update
    G5Updatable::ClientFeedProcessor.work
    render json: {}, status: :ok
  end
end
