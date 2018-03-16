json.user do
  json.id contestant.user.id
  json.username contestant.user.username
  json.email contestant.user.email
end

json.first_name contestant.first_name
json.last_name contestant.last_name
json.school contestant.school.name
