class Dictionary

    attr_reader :letter, :braille

  def initialize(data_line)
    @letter  = data_line[:letter]
    @braille = data_line[:braille]
  end

end
