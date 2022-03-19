# == Schema Information
#
# Table name: db_logs
#
#  id               :bigint           not null, primary key
#  controller_name  :string
#  current_user     :json
#  date_time        :date
#  ip               :string
#  method           :string
#  parameters       :json
#  remote_ip        :string
#  request          :string
#  request_fullpath :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class DbLog < ApplicationRecord
end
