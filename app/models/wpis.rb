class Wpis < ActiveRecord::Base
acts_as_authorization_object
  belongs_to :photospace
end
