class UserFeed < ActiveRecord::Base

  validates :user, :feed, presence: true
  validates :user_id, uniqueness: { scope: :feed_id, message: 'already subscribed to that feed' }

  belongs_to :user, inverse_of: :user_feeds
  belongs_to :feed, inverse_of: :user_feeds
end
