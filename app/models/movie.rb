class Movie < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  validates_presence_of :name, :director
  validates_numericality_of :year, :length, :greater_than => 0
  validates_uniqueness_of :name, :message => "is already used silly"
  validates_length_of :format, :maximum => 7, :minimum => 2
  def proper_name
    name.titleize
  end

  paginates_per 5

end
