
require File.expand_path(File.dirname(__FILE__) + '/neo')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
  0 if dice.empty?
end

# def score(dice)
#   # You need to write this method
#   score = 0 # The score
#
#   def del_triplets(num, dice) # Method that deletes triplet numbers from the dice array
#     i = 0
#     loop do
#       i += 1
#       dice.delete_at(dice.find_index(num))
#       break if i == 3
#     end
#   end
#
#   dice.each { |num| # For each element in dice array...
#     if dice.count(num) >= 3 # if triplets found
#       if num == 1 # if its 1..
#         score += 1000 # Add 1000 to the score
#         del_triplets(num, dice) # Run method to delete the triplet numbers
#         break
#       elsif num == 5 # if its 5...
#         score += 500 # Add 500 to the score
#         del_triplets(num, dice)
#         break
#       else # if its 2, 3, 4, or 6...
#         score += num * 100 # multiple the number by 100
#         del_triplets(num, dice)
#         break
#       end
#     end
#   }
#
#   dice.each { |num| # For each remaining element in dice array...
#     score += 50 if num == 5 # Increase score by 50 for each 5
#     score += 100 if num == 1 # Increase score by 100 for each 1
#   }
#
#   return score # Returns the final score
# end

class AboutScoringProject < Neo::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
   assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
   assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
   assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
    assert_equal 1100, score([1,1,1,1])
    assert_equal 1200, score([1,1,1,1,1])
    assert_equal 1150, score([1,1,1,5,1])
  end

end
