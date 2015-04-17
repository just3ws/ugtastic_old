class NotFound < ActiveRecord::Base
  validates :url, presence: true

  rails_admin do
    list do
      field :url do
        pretty_value do
          URI.parse(value).path
        end
      end
      field :created_at
    end
  end
end

# == Schema Information
#
# Table name: not_founds
#
#  id         :uuid             not null, primary key
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
