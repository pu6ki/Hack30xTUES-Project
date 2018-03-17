json.id recruiter.id
json.website recruiter.website
json.company_name recruiter.company_name

json.user do
  json.partial! 'devise/shared/user', user: recruiter.user
end

json.technologies recruiter.technologies do |technology|
  json.partial! 'technologies/technology', technology: technology
end
