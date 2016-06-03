class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user

  def idea_like current_user
  	Like.select(:id).where(user: current_user, idea: self)[0].id
  end


end
