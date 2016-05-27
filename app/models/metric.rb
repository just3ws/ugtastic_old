# frozen_string_literal: true
class Metric < ActiveRecord::Base
  scope :not_found, -> { where(request_action: 'intercept_404') }

  rails_admin do
    list do
      sort_by :created_at
      field :request_url do
        pretty_value do
          URI.parse(value).path
        end
      end
      field :request_user_agent
      field :created_at do
        sort_reverse true
      end
    end
  end
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
