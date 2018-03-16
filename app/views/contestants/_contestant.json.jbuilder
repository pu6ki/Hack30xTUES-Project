json.first_name contestant.first_name
json.last_name contestant.last_name
json.school contestant.school.name

json.user do
  json.partial! 'devise/shared/user', user: contestant.user
end
