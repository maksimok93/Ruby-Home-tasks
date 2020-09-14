def create_text_file(filename)
  File.new("#{filename}.txt", "w")
end

def edit_existing_file(filename)
  new_file = File.open("#{filename}.txt", "w")

  puts "Enter any text to write to the file:"
  user_input = gets.chomp
  new_file.syswrite(user_input)
  new_file.close
end

def display_file_content(filename)
  content = IO.readlines("#{filename}.txt")
  puts "Please, see file content below:"
  puts content
end

def delete_file(filename)
  File.delete("#{filename}.txt")
  if File.file?(filename) == false
    puts "File has been successfully deleted."
  end
end

if __FILE__ == $0
  puts "Please, enter a filename you want to create: "
  filename = gets.chomp
  create_text_file(filename)
  edit_existing_file(filename)
  display_file_content(filename)
  delete_file(filename)
end
