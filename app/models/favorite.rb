class Favorite < ActiveRecord::Base

  belongs_to :user, inverse_of: :favorites
  belongs_to :favoritable, polymorphic: true
end
