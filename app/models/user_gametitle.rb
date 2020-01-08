class UserGametitle < ApplicationRecord
  belongs_to :user
  belongs_to :gametitle
  counter_culture :gametitle, column_name: "user_gametitle_count", touch: true
end
