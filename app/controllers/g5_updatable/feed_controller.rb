class G5Updatable::FeedController < ApplicationController
  def index
    render text: "Nothing to see here..."
  end

  def client_name
    render text: G5Updatable::ClientFeedProcessor.client_name
  end

  def update
    #Resque.enqueue(ClientUpdaterJob)
    G5Updatable::ClientFeedProcessor.work
    render json: {}, status: :ok
  end
end
