json.id recruiter.id
json.website recruiter.website
json.company_name recruiter.company_name

json.user do
  json.partial! 'devise/shared/user', user: recruiter.user
end

json.technologies recruiter.technologies do |tech|
  json.id tech.id
  json.name tech.name
  json.hackerrank_code tech.hackerrank_code
end
