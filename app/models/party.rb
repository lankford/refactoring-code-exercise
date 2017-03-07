#
# Table Schema
# ------------
# id            - int(11)      - default NULL
# host_name     - varchar(255) - default NULL
# host_email    - varchar(255) - default NULL
# numgsts       - int(11)      - default NULL
# guest_names   - text         - default NULL
# venue         - varchar(255) - default NULL
# location      - varchar(255) - default NULL
# theme         - varchar(255) - default NULL
# when          - datetime     - default NULL
# when_its_over - datetime     - default NULL
# descript      - text         - default NULL
#
class Party < ApplicationRecord

  alias_attrib :when, :start_time # when conflicts with reserved ruby keyword

  validates_length_of :host_name, :host_email, :venue, :location, :theme, maximum: 255
  validates_presence_of :venue, :location, :message => "Where is the party?"
  validates :guest_names, :equal_to => number_of_guest_names, :message => "Missing guest name"
  validates_presence_of :start_time, :when_its_over
  validates :when_its_over, :greater_than => start_time, :message => "Party end time needs to be after the start time"

  before_save :format_guest_names

  def numgsts
    read_attribute(:numgsts) || 0
  end

  def number_of_guest_names
    guest_names.split(',').size
  end

  def format_guest_names
    # this is a bit of tricky code that uses the non-greedy nature of .sub
    # in order to pruduce a very odd requirement of secondary spaces be
    # replaced with an underscore
    self.guest_names = guest_names.squeeze(' ').split(',').each do |name|
      name.gsub!(/ /,'_').sub!(/_/,' ')
    end.join(',')
  end

end
