require './image'

source_path = "G:/Projects/work/Jean Wyatt/jwyattart.com Redesign/backups/jwyattart.com/public_html/wp-content/Uploads - copy"

regexp = /^([a-zA-Z]{1,4}\d{1,4}-?\d{0,4}).+\.(jpg|png)/
Dir.glob("#{source_path}/**/*.jpg") do |file|
  name = File.basename(file)
  match = name[regexp, 1]
  if match
    image = Image.new(path: file)
    image.copy
    puts match.to_s.upcase
  end
end