class G5Updatable::FeedController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token

  def update
    G5Updatable::ClientFeedProcessor.new(params[:client_uid]).work
    render json: {}, status: :ok
  end
end
