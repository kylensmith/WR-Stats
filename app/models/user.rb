class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	before_save :set_admin

  private
  def set_admin
    if User.count == 0
      self.admin = true
      self.super_admin = true
    end
  end
end
