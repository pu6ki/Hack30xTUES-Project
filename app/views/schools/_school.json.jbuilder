json.id school.id
json.website school.website
json.name school.name

json.user do
  json.partial! 'users/user', user: school.user
end

json.contestants school.contestants do |contestant|
  json.partial! 'contestants/contestant', contestant: contestant
end
