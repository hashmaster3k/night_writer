class NightWriter

    def initialize(input_text, output_text)
      puts "Created #{output_text} containing #{input_text.length} characters"
    end #initialize

end #NightWriter

NightWriter.new(ARGV[0], ARGV[1])
