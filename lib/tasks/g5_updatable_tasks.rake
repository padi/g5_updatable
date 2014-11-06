namespace :g5_updatable do
  DEFAULT_G5_HUB_CLIENTS_URL = 'https://g5-hub.herokuapp.com/clients.json'

  desc 'loads all of g5-hub into local DB. Note: the ENV variables for G5-Auth need to be set!'
  task load_all: :environment do
    clients_url = ENV['G5_HUB_CLIENTS_URL'] || DEFAULT_G5_HUB_CLIENTS_URL
    puts "loading clients from #{clients_url}...."

    G5Updatable::ClientFeedProcessor.load_all_clients(clients_url)
    puts 'Success!!'
  end
end
