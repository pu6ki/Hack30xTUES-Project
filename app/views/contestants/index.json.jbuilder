json.contestants @contestants do |contestant|
  json.partial! 'contestants/contestant', contestant: contestant
end
