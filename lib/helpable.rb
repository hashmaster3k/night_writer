module Helpable

  def input_file_path
    "./texts/#{input_file}"
  end

  def output_file_path
    "./texts/#{output_file}"
  end

  def read_file
    File.read(input_file_path)
  end

  def find_matching_letter_braille_pair(letter)
    @dictionary.find {|letter_obj| letter_obj.letter == letter}
  end

  def find_reverse_letter_braille_pair(braille_letter)
    @dictionary.find {|letter_obj| letter_obj.braille == braille_letter}
  end

  def create_message
    "Created #{output_file} containing #{read_file.length} characters"
  end

end
