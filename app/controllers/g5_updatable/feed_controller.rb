class G5Updatable::FeedController < ApplicationController
  def update
    #Resque.enqueue(ClientUpdaterJob)
    G5Updatable::ClientFeedProcessor.work
    render json: {}, status: :ok
  end
end
