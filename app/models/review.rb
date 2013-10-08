class Review < ActiveRecord::Base
  attr_accessible :agency_id, :user_id, :body
  belongs_to :user
  belongs_to :agency
  validates :agency_id, :presence => true
  validates :user_id, :presence => true
  validates :body, :presence => true
  validates :user_id, :numericality => true
  validates :agency_id, :numericality => true

  def self.get_users(reviews)
    user_review_hash = Hash.new
    reviews.each do |review|
      user_review_hash[[User.find(review.user_id), review.id]] = review
    end
    return user_review_hash
  end
end