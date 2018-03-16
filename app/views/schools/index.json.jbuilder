json.schools @schools do |school|
  json.partial! 'schools/school', school: school
end
