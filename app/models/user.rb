class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  mount_uploader :picture, PhotoUploader

 
  has_many :events
  has_many :comments, dependent: :destroy #, through: :events

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :comments

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  # ^
  # active_relationship.follower => Returns the follower
  # active_relationship.followed => Returns the followed user
  # user.active_relationships.create(followed_id: other_user.id) => Creates an active relationship associated with user
  # user.active_relationships.create!(followed_id: other_user.id) => Creates an active relationship associated with user (exception on failure)
  # user.active_relationships.build(followed_id: other_user.id) => Returns a new Relationship object associated with user

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
  # ^
  # user.following.include?(other_user)
  # user.following.find(other_user)
  # user.following << other_user
  # user.following.delete(other_user)


  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
