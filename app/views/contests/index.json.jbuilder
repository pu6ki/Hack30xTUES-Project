json.contests @contests do |contest|
  json.partial! 'contests/contest', contest: contest
end
