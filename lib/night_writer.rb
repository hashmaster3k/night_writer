class NightWriter

  attr_reader :input_file_path, :output_file_path

  def initialize(input_file, output_file)
    @input_file_path  = "./#{input_file}"
    @output_file_path = "./#{output_file}"
    puts "Created #{output_file} containing #{input_file.length} characters"
  end #initialize

  def copy_text_and_write
    copied_text = File.read(@input_file_path)
    File.open(@output_file_path, "w") { |f| f.write copied_text}
  end

end #NightWriter

#NightWriter.new(ARGV[0], ARGV[1])
