def create_text_file(filename)
  File.new("#{filename}.txt", "w")
end

def edit_existing_file(filename)
  new_file = File.open("#{filename}.txt", "w")

  puts "Enter any text to write to the file:"
  user_input = gets.chomp
  new_file.syswrite("#{user_input}\n")
  new_file.syswrite("Recording time: #{Time.now}")
  new_file.close
end

def display_file_content(filename)
  content = IO.readlines("#{filename}.txt")
  puts "Please, see file content below:"
  puts content
end

def file_exists?(filename)
  File.file?(filename)
end

def delete_file(filename)
  File.delete("#{filename}.txt")
  puts file_exists?(filename) ? "File is still enable!" : "File has been successfully deleted."
end

puts "Please, enter a filename you want to create: "
filename = gets.chomp
create_text_file(filename)
edit_existing_file(filename)
display_file_content(filename)
delete_file(filename)
