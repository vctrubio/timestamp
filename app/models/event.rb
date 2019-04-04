class Event < ApplicationRecord
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  mount_uploader :picture, PhotoUploader

  def active?
    self.end_time ? Time.now < self.end_time : false
  end

  def mine?(event_user)
    user_id == event_user.id
  end

  include PgSearch
  pg_search_scope :event_search,
    against: [:title],
    associated_against: {
      user: [:username]
    },
    using: {
      tsearch: { prefix: true }
    }
end
