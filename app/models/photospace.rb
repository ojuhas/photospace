class Photospace < ActiveRecord::Base

acts_as_authorization_object
# paperclip
has_attached_file :photo, :styles => {
  :thumb=> "100x100#",
  :small  => "150x150>",
} 
has_many :wpisy
belongs_to :kategoria

  
end
