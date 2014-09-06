class Photo < ActiveRecord::Base
	# every photo belongs to user
  belongs_to :owner, :class_name => 'User', :inverse_of => :photos, :foreign_key => :user_id
  # every photo belongs to album
  belongs_to :album, :inverse_of => :photos

  # paperclip attachment
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  # validations for image and tagline
  validates_attachment_content_type :image, :content_type => /^image\/(png|gif|jpeg)/
  validates_attachment :image, :presence => true
  validates :tag_line, :presence => true
end
