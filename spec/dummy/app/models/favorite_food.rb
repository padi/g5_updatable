class FavoriteFood < ActiveRecord::Base
  include G5Updatable::BelongsToLocation
end
