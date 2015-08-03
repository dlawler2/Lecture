class Comment < ActiveRecord::Base
  belongs_to :movie

  def self.descending
    return order(:created_at=>:desc)
  end
end
