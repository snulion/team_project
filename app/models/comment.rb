class Comment < ActiveRecord::Base
    belongs_to  :post        # Post-Comment 1:N
    
    def self.default_scope
      where published: true
    end
end
