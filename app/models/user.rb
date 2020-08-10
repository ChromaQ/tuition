# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  current_sign_in_at :datetime
#  current_sign_in_ip :string
#  displayname        :string
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :string
#  sign_in_count      :integer          default(0), not null
#  superuser          :boolean          default(FALSE)
#  username           :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  employee_id        :string
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  # enforce CASino authentication
  devise :cas_authenticatable, :timeoutable
  # ensure a valid username is returned from CASino
  # => And that when authenticating use a case-insensitive comparison.
  # => Because some people are USERname and others are username.
  # => And when people switch position types these alpha characteraztions can change
  validates :username, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  # For displaying the current users name (Smith, John)  (this is passed from CASino)
  validates :displayname, presence: true

  # Update additional user attributes passed from CASino
  # => You can update/add any attributes passed from CASino using this method.
  def cas_extra_attributes=(extra_attributes)
    extra_attributes.each do |name, value|
      case name.to_sym
      when :displayname
        self.displayname = value
       when :employeeid
         self.employee_id = value
      when :memberof
        if !value.nil?
          # Verify if the person hitting the app is part of devgroup
          self.superuser = value.include?('CN=devgroup,OU=UNMH_IT_Admin,OU=Group,OU=UNMH,DC=health,DC=unm,DC=edu')
        end
      end
    end
  end
end
