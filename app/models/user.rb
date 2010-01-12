class User < ActiveRecord::Base
    acts_as_authentic
    acts_as_authorization_subject
    has_many :roles, :as => :authorizable

end
