class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :registerable, , :validatable

  belongs_to :rol
  belongs_to :persona

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable,
         :registerable, :validatable

  def rol?(role_sym)
    self.rol.nombre.to_sym == role_sym
  end
end
