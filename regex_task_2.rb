# Extract from URL:
# https://jira.sco.cisco.com/secure/RapidBoard.jspa?rapidView=98&view=detail&selectedIssue=AVCTOOLS-2390
# the following parameters: rapidView=98, view = detail

def extract_data(str)
  p str.scan(/(?<=\?|&).+?(?=\&)/).join(', ')
end

extract_data('https://jira.sco.cisco.com/secure/RapidBoard.jspa?rapidView=98&view=detail&selectedIssue=AVCTOOLS-2390')
