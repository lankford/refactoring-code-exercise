require "minitest/autorun"

class Meme

  def self.process_names guest_names
    gnames = []
    guest_names.split(',').each do |g|
      g.squeeze!
      names=g.split(' ')
      gnames << "#{names[0]} #{names[1..-1].join('_')}"
    end
    guest_names = gnames
  end

end

class TestMeme < Minitest::Test

  def setup
    # Using input data from comment
    @processed_names = Meme.process_names "Harry S. Truman,Roger     Rabbit"
  end

  def test_check_the_names_are_what_they_are_supposed_to_be
    # Using test data from comment
    assert_equal @processed_names , "Harry S._Truman,Roger Rabbit"
  end

end