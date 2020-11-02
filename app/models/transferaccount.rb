class Transferaccount < ApplicationRecord
  belongs_to :transfer
  belongs_to :account
end
