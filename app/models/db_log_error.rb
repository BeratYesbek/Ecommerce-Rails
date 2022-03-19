# == Schema Information
#
# Table name: db_log_errors
#
#  id               :bigint           not null, primary key
#  controller_name  :string
#  current_user     :json
#  date_time        :date
#  exception        :string
#  exception_detail :string
#  ip               :string
#  method           :string
#  parameters       :json
#  remote_ip        :string
#  request          :string
#  request_fullpath :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class DbLogError < ApplicationRecord
end
