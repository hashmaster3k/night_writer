class NightWriter

  attr_reader :input_file, :output_file

  def initialize(input_file, output_file)
    @input_file  = input_file
    @output_file = output_file
    puts "Created #{output_file} containing #{input_file.length} characters"
  end #initialize

end #NightWriter

#NightWriter.new(ARGV[0], ARGV[1])
