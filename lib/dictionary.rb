require 'csv'

class Dictionary

    attr_reader :letter, :braille

  def initialize(line_of_data)
    @letter  = line_of_data[:letter]
    @braille = line_of_data[:braille]
  end

  def self.from_csv(path)
      return [] if !File.exist?(path)
      braille_dictionary = []
      CSV.foreach(path, headers: true, header_converters: :symbol) do |line_of_data|
        braille_dictionary << new(line_of_data)
      end
      braille_dictionary
  end
end
