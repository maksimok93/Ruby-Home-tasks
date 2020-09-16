require 'set'

def check_input_length(password)
  if password.length.between?(8, 32)
    return true
  else return "Password length should be more than 8 characters!"
  end
end

def check_uppercase_lowercase_chars(password)
  if password.scan(/[A-Z][a-z]/).length < 1
    return "Password must contain uppercase and lowercase characters!"
  else return true
  end
end

def find_special_symbols(password)
  characters = "~!@#$%^&*()-=+{[}]|\\/|:;,.?"

  intersection = (characters.chars.to_set & password.chars.to_set)
  symbols_in_password = intersection.length

  if symbols_in_password < 1
    return "Password must contain at least one special character!"
  else return true
  end

end

if __FILE__ == $0
  puts "Please, enter the password: "
  user_input = gets.chomp
  puts check_input_length(user_input)
  puts check_uppercase_lowercase_chars(user_input)
  puts find_special_symbols(user_input)
end