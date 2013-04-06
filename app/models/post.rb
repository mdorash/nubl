class Post < ActiveRecord::Base
  validates :title, :url, :presence => true
  attr_accessible :created_at, :url, :text, :user_id, :title, :rating, :post_id
  has_many :comments, :dependent => :destroy

end