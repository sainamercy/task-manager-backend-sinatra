class Task < ActiveRecord::Base
    enum :status, [ :CREATED, :ONGOING, :COMPLETED, :CANCELLED ]
    enum :priority, [ :LOW, :MEDIUM, :HIGH]
    belongs_to :user
end