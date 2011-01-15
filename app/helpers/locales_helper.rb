module LocalesHelper
  def get_locales
    locales = {}
    path = File.join(Rails.root, 'config', 'locales')

    locales = Dir.new(path).entries.collect do |x|
      x =~ /^[^\.].+\.yml$/ ? x.sub(/\.yml/, "") : nil
    end.compact.each_with_object({}) do |str, hsh|
      locale_file = YAML.load_file(path + "/" + str + ".yml")
      str = str.gsub("_spree", "")
      hsh[str] = locale_file[str]["this_file_language"] if locale_file.has_key? str
    end
    locales.merge! locales
  end

  def flag_image(code)
    "#{code.to_s.split("-").last.downcase}.png"
  end
end


