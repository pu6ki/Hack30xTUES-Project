json.id school.id
json.website school.website
json.name school.name

json.user do
  json.partial! 'devise/shared/user', user: school.user
end
