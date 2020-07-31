module Searchable

  def find_matching_letter_braille_pair(letter)
    @dictionary.find {|letter_obj| letter_obj.letter == letter}
  end

end
