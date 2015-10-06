class User < ActiveRecord::Base

  SCHOOL = [['Ramapo', 'ramapo'], ['William Paterson', 'william_paterson'], ['FDU', 'fdu'], ['Felician', 'felician'], ['SIT', 'sit'], ['Saint Peter\'s', 'saint_peters'], ['NJCU', 'njcu'], ['Montclair State', 'montclair_state'], ['Caldwell', 'caldwell'], ['Bloomfield', 'bloomfield'], ['NJIT', 'njit'], ['Seton Hall', 'seton_hall'], ['Kean', 'kean'], ['College of Saint Elizabeth', 'college_of_saint_elizabeth'], ['Drew', 'drew'], ['Rutgers-Newark', 'rutgers_newark'], ['Centenary', 'centenary'], ['Princeton', 'princeton'], ['Rider', 'rider'], ['TCNJ', 'tcnj'], ['Rowan', 'rowan'], ['Rutgers-Camden', 'rutgers_camden'], ['Stockton', 'stockton'], ['Rutgers-New Brunswick', 'rutgers_new_brunswick'], ['Monmouth', 'monmouth'], ['Georgian Court', 'georgian_court']]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Model relationships
  has_many :conversations
  has_many :appointments

  def name
    if self.first_name.present? and self.last_name.present?
      return "#{self.first_name} #{self.last_name}"
    else
      if self.first_name.present?
        return self.first_name
      elsif self.last_name.present?
        return self.last_name
      else
        return ''
      end
    end
  end

  def languages
    [language_one, language_two, language_three].reject{ |l| l.nil? or l.empty? }.join(",")
  end

end
