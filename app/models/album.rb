class Album < ActiveRecord::Base
	belongs_to :owner, :class_name => 'User', :inverse_of => :albums, :foreign_key => :user_id
	# has many photos , when album destroy all associated phtos will destroy
	has_many :photos , :inverse_of => :album, :dependent => :destroy

  # nested form (album with photos)
  accepts_nested_attributes_for :photos, :allow_destroy => true

  # validations for album name and owner
  validates :user_id, :presence => true

  # validations for photos maximum 25 images
  validates :photos, :length => { :maximum => 25, :message => "maximum 25 per album"}

  # validations for album uniq name to respective user to avoid ambiguity.
  validates :name, uniqueness: {scope: :user_id}, presence: true

end
