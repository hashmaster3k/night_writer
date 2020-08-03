require './lib/night_writer'
require './lib/night_reader'

#ruby ./lib/runner.rb message.txt braille.txt
#ruby ./lib/runner.rb braille.txt original_message.txt

if ARGV[0] == "message.txt"
  NightWriter.new(ARGV[0], ARGV[1])
else
  NightReader.new(ARGV[0], ARGV[1])
end
