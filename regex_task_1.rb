# This script checks for correct e-mail, like:
# natasha@gmail.com, iryska666@i.ua, test@softserveinc.com
# And excludes e-mails containing 'xxx', 'spam' or 'trojan'

def valid_email?(email)
  # We use !! to convert the return value to a boolean
  !!email.match(/\A[\w.+-]+@\w+\.\w+\z/)
end

def excludes_matches?(email)
  matches = email.scan(Regexp.union(/trail/, /xxx/, /spam/, /trojan/))
  matches.length == 0 ? true : false
end

while true
  p "Type an e-mail for checking: "
  email = gets.chomp
  if valid_email?(email.to_s) && excludes_matches?(email.to_s)
    p 'Email has been approved.'
    break
  else
    p 'Type another e-mail!'
  end
end
