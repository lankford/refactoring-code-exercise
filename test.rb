require "minitest/autorun"

class Meme

  def self.process_names guest_names
    gnames = []
    guest_names.squeeze(' ').split(',').each do |name|
      # gnames << add_underscores_to_non_first_names(name)
      gnames << name.gsub(/ /,'_').sub(/_/,' ')
    end
    guest_names = gnames.join(',')
  end

end

class TestMeme < Minitest::Test

  def setup
    # Using input data from comment
    @processed_names = Meme.process_names "Harry S. Truman,Roger     Rabbit"
  end

  def test_check_the_names_are_what_they_are_supposed_to_be
    # Using test data from comment
    assert_equal "Harry S._Truman,Roger Rabbit" , @processed_names 
  end

end
