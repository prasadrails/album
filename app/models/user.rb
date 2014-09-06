class User < ActiveRecord::Base
  has_many :albums, :inverse_of => :owner
  has_many :photos, :inverse_of => :owner

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
