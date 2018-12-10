songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(songs)
  songs.each_with_index do |song, index|
    puts "#{index + 1}. #{song}"
  end
end

def play(songs)
  puts "Please enter a song name or number:"
  input = gets.chomp
  song = ""
  if input.length == 1
    if input.to_i.between?(1,9)
      song = songs[input.to_i - 1]
    else
      puts "Invalid input, please try again"
    end
  else
    index = songs.select {|song| song.downcase.include?(input.downcase)}
    if index.empty?
      puts "Invalid input, please try again"
    else
      song = index[0]
    end
  end
  puts "Playing #{song}"
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  puts "Please enter a command:"
  input = gets.chomp
  until input == "exit" do
    case input
    when "help"
      help
    when "list"
      list(songs)
    when "play"
      play(songs)
    else
      "Invalid command. Please try again."
    end
    input = gets.chomp
  end
  exit_jukebox
end
