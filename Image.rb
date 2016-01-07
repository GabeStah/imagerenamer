require 'fileutils'

class Image

  $source_path = "G:/Projects/work/Jean Wyatt/jwyattart.com Redesign/backups/jwyattart.com/public_html/wp-content/Uploads - copy"
  $dest_path = "G:/Projects/work/Jean Wyatt/jwyattart.com Redesign/backups/jwyattart.com/public_html/wp-content/ruby"

  def initialize(args = {})
    self.path ||= args[:path]
  end

  def copy
    # If exists
    if exists
      # New size larger
      if size > File.size(dest_file)
        # Delete current
        File.delete(dest_file)
        # copy
        FileUtils.copy(self.path, dest_file)
      end
    else
      # No exist, copy
      FileUtils.copy(self.path, dest_file)
    end
  end

  def dest_file
    "#{$dest_path}/#{sku}.jpg"
  end

  def exists
    File.exists?(dest_file)
  end

  def path
    @path
  end

  def path=(path)
    @path = path
  end

  def name
    File.basename(self.path)
  end

  def size
    File.size(self.path)
  end

  def sku
    regexp = /^([a-zA-Z]{1,4}\d{1,4}-?\d{0,4}).+\.(jpg|png)/
    match = name[regexp, 1]
    if match
      match.to_s.upcase
    end
  end
end