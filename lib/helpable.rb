module Helpable

  def find_matching_letter_braille_pair(letter)
    @dictionary.find {|letter_obj| letter_obj.letter == letter}
  end

  def find_reverse_letter_braille_pair(braille_letter)
    @dictionary.find {|letter_obj| letter_obj.braille == braille_letter}
  end

  def created_message
    content = File.read(output_file_path)
    "Created #{output_file} containing #{content.length} characters"
  end

end
