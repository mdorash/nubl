class Comment < ActiveRecord::Base
  attr_accessible :text, :post_id
  validates :text, :post_id, :presence => true
  belongs_to :post
  #belongs_to :user
end
