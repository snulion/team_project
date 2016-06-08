class Comment < ActiveRecord::Base
    belongs_to  :post        # Post-Comment 1:N
end
