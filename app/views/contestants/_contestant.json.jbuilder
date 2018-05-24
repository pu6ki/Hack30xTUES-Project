json.id contestant.id
json.first_name contestant.first_name
json.last_name contestant.last_name

json.user do
  json.partial! 'users/user', user: contestant.user
end
