module Recommendable
  class Dislike < ActiveRecord::Base
    self.table_name = 'recommendable_dislikes'

    belongs_to :user, :class_name => Recommendable.user_class.to_s, :foreign_key => :user_id
    belongs_to :dislikeable, :polymorphic => true
    
    validates :user_id, :uniqueness => { :scope => [:dislikeable_id, :dislikeable_type],
                                         :message => "has already disliked this item" }
  end
end
