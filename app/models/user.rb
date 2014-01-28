class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:login]
  # acts_as_authentic do |c|
  #    c.login_field = 'email'
  # end # block optional

  attr_accessor :login



  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end


  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["username = :value OR lower(email) = lower(:value)", 
        							{ :value => login }]).first
      else
        where(conditions).first
      end
  end

end
