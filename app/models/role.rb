class Role < ActiveRecord::Base
acts_as_authorization_role
belongs_to :authorizable, :polymorphic => true
 
end
