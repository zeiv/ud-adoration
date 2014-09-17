class User < ActiveRecord::Base
  belongs_to :role
  before_create :add_user_role  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role_symbols
    [role.title.to_sym]
  end

  def name
    "#{first_name} #{last_name}"
  end

  private

  def add_user_role
    self.role = Role.find_by_title 'user'
  end



end
