if RAILS_ENV == "development"
  Paperclip.options[:image_magick_path] = '/opt/local/bin'
elsif RAILS_ENV == "production"
  #change this to your production 'convert' path
  Paperclip.options[:command_path] = "/usr/local/bin"
end