class ChangeNvarcharColumnsToVarchars < ActiveRecord::Migration[6.0]
  def change

    change_column :users, :employee_id, :varchar, limit: 50
    change_column :users, :displayname, :varchar, limit: 200
    change_column :users, :username, :varchar, limit: 100
    change_column :users, :current_sign_in_ip, :varchar, limit: 100
    change_column :users, :last_sign_in_ip, :varchar, limit: 100
    change_column :users, :company, :varchar, limit: 50
    change_column :users, :email, :varchar, limit: 200

    change_column :approvals, :employee_id, :varchar, limit: 50
    change_column :approvals, :deny_reason, :string

    change_column :courses, :employee_id, :varchar, limit: 50
    change_column :courses, :cost_estimate_currency, :varchar, limit: 50
    change_column :courses, :course_short, :varchar, limit: 50
    change_column :courses, :course_title, :varchar, limit: 200

    change_column :credentials, :name, :varchar, limit: 50
    change_column :credentials, :description, :varchar, limit: 200

    change_column :degrees, :name, :varchar, limit: 50

    change_column :goals, :focus, :varchar, limit: 200

    change_column :schools, :opeid, :varchar, limit: 50
    change_column :schools, :name, :varchar, limit: 200
    change_column :schools, :city, :varchar, limit: 200
    change_column :schools, :aka, :varchar, limit: 500

  end
end
