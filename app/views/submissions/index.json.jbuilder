json.submissions @submissions do |submission|
  json.partial! 'submissions/submission', submission: submission
end
