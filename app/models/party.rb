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

    def numgsts
      read_attribute(:numgsts) || 0
    end

  validate :validations

  def validations
    if start_time > when_its_over
      errors.add(:base,"Incorrect party time.")
    end
  end

  def after_save
    # clean "Harry S. Truman" guest name to "Harry S._Truman"
    # clean "Roger      Rabbit" guest name to "Roger Rabbit"
    gnames = []
    guest_names.split(',').each do |g|
      g.squeeze!
      names=g.split(' ')
      gnames << "#{names[0]} #{names[1..-1].join('_')}"
    end
    guest_names = gnames
    save!
  end

  def number_of_guest_names
    guest_names.split(',').size
  end

end
