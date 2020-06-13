class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  VALID = /\A[a-zA-Z]+\z/
  MSG = "Only letters allowed"
end
