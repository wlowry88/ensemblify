class Interest < ActiveRecord::Base
  belongs_to :user
  belongs_to :instrumentation
end
