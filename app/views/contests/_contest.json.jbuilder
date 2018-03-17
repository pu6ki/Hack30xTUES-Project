json.id contest.id
json.title contest.title
json.description contest.description
json.technology contest.technology

json.recruiter do
  json.partial! 'recruiters/recruiter', recruiter: contest.recruiter
end

json.submissions contest.submissions do |submission|
  json.partial! 'submissions/submission', submission: submission
end
