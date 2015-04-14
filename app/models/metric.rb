class Metric < ActiveRecord::Base
end

# == Schema Information
#
# Table name: metrics
#
#  id                   :uuid             not null, primary key
#  session_id           :string
#  request_action       :string
#  request_controller   :string
#  request_ip           :string
#  request_method       :string
#  request_referrer     :string
#  request_requestor_ip :string
#  request_url          :string
#  request_user_agent   :string
#  request_xff          :string
#  user_id              :uuid
#  request_params       :jsonb
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#