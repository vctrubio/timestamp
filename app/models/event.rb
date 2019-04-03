class Event < ApplicationRecord
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  mount_uploader :picture, PhotoUploader

  def active?
    self.end_time ? Date.today < self.end_time : false
  end

  def mine?(user)
    self.user.id == user.id
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
