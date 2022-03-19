class CreateDbLogErrors < ActiveRecord::Migration[6.1]
  def change
    create_table :db_log_errors do |t|
      t.json :parameters
      t.json :current_user
      t.date :date_time
      t.string :method
      t.string :controller_name
      t.string :remote_ip
      t.string :ip
      t.string :request
      t.string :request_fullpath
      t.string :exception
      t.json :exception_detail

      t.timestamps
    end
  end
end
