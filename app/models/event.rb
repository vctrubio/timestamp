class Event < ApplicationRecord
  # geocoded_by :address
  belongs_to :user
  has_many :comments, dependent: :destroy
    # validates :username, presence: true
  validates :title, presence: true

  # after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :global_search,
    against: [ :title, :description ],
    associated_against: {
      user: [ :username ]
    },
    using: {
      tsearch: { prefix: true }
    }

  mount_uploader :picture, PhotoUploader

end
