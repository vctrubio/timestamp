class Event < ApplicationRecord

    belongs_to :user
    has_many :comments, dependent: :destroy

    # validates :username, presence: true
    validates :title, presence: true

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

# create_table "events", force: :cascade do |t|
#   t.string "title"
#   t.string "description"
#   t.float "latitude"
#   t.float "longitude"
#   t.datetime "start_time"
#   t.string "end_time"
#   t.string "picture"
#   t.bigint "user_id"
