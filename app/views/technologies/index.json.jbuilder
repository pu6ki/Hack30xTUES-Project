json.technologies @technologies do |technology|
  json.partial! 'technology', technology: technology
end
