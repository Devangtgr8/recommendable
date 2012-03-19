module Recommendable
  class Ignore < ActiveRecord::Base
    self.table_name = 'recommendable_ignores'

    belongs_to :user, :class_name => Recommendable.user_class.to_s, :foreign_key => :user_id
    belongs_to :ignoreable, :polymorphic => true
    
    validates :user_id, :uniqueness => { :scope => [:ignoreable_id, :ignoreable_type],
                                         :message => "has already ignored this item" }
  end
end
