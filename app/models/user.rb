class User < ActiveRecord::Base

  SCHOOL = [['Ramapo', 'ramapo'], ['William Paterson', 'william_paterson'], ['Felician', 'felician'], ['SIT', 'sit'], ['Saint Peter\'s', 'saint_peters'], ['NJCU', 'njcu'], ['Montclair State', 'montclair_state'], ['Caldwell', 'caldwell'], ['Bloomfield', 'bloomfield'], ['NJIT', 'njit'], ['Seton Hall', 'seton_hall'], ['Kean', 'kean'], ['College of Saint Elizabeth', 'college_of_saint_elizabeth'], ['Drew', 'drew'], ['Rutgers-Newark', 'rutgers_newark'], ['Centenary', 'centenary'], ['Princeton', 'princeton'], ['Rider', 'rider'], ['TCNJ', 'tcnj'], ['Rutgers-Camden', 'rutgers_camden'], ['Stockton', 'stockton'], ['Rutgers-New Brunswick', 'rutgers_new_brunswick'], ['Monmouth', 'monmouth'], ['Georgian Court', 'georgian_court'], ['Robert Wood Johnson Medical School', 'rwjms'], ['New Jersey Medical School', 'njms'], ['Rowan School of Medicine', 'rowan_som'], ['Rowan University', 'rowan_university'], ['Cooper Medical School', 'cooper_medical_school'], ['Rutgers Pharmacy (Ernesto Mario School of Pharmacy)', 'rutgers_pharmacy'], ['FDU - Teaneck ', 'fdu_teaneck'], ['FDU - Madison', 'fdu_madison'], ['Atlantic Cape Community College', 'atlantic_cape_cc'], ['Bergen Community College', 'bergen_cc'], ['Brookdale Community College', 'brookdale_cc'], ['Burlington County College/Rowan College at Burlington County', 'rowan_burlington_cc'], ['Camden County College', 'camden_cc'], ['Cumberland County College', 'cumberland_cc'], ['Essex County College', 'essex_cc'], ['Gloucester County College/Rowan College at Gloucester County', 'rowan_gloucester_cc'], ['Hudson County Community College', 'hudson_cc'], ['Mercer County Community College', 'mercer_cc'], ['Middlesex County College', 'middlesex_cc'], ['Ocean County College', 'ocean_cc'], ['Passaic County Community College', 'passaic_cc'], ['Raritan Valley Community College', 'raritan_valley_cc'], ['Salem Community College', 'salem_cc'], ['Sussex County Community College', 'sussex_cc'], ['Union County College', 'union_cc'], ['Warren County Community College', 'warren_cc']]

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

  def school_name
    SCHOOL.detect{ |(_,s)| s==school }[0] rescue nil
  end

end
