class ColumbusBeer::CLI
    def start 
        puts "Welcome to the ColumbusBeer App!"
        puts "What kind of Beer are your having? Press any key to view our selection"
        input = gets.chomp.downcase 
        ColumbusBeer::API.get_beers
        display_def
        more_options
        loop_or_exit
    end 

  def display_def
    ColumbusBeer::Beers.all.each.with_index(1) do |b,index|
        puts "#{index}. #{b.name}"
        puts " <><><><><><><><><><><><><><><><><><><><><><><><><>".red 
        end 
    end 

    def more_options
        puts "Please choose your beer selection! Type a number between 1-10"
        input = gets.chomp.to_i 
        index = input - 1 
        user_choice = ColumbusBeer::Beers.all[index]
        sleep (1)
        puts "Great choice! You selected: #{user_choice.name}".light_cyan
        puts "--------------------------------------------------------".light_black
        sleep (1)
        puts "Here is a description of your brew:" 
        sleep (1)
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>".light_red
        puts "#{user_choice.description}"
    end 

    def loop_or_exit 
        puts "####################################################".light_black
        puts "Would you like to have another beer? Enter y/n"
        input = gets.chomp.downcase 
        if input == "y"
            start
        else 
           puts "Would you like to see your previous beer choices?" 
           new_input = gets.chomp.downcase 
           history(new_input)
        end
    end 

    def display_all_beers
        ColumbusBeer::Beers.all.each.with_index(1) do |b,index|
          puts "#{index}. #{b.name}"  
        end 
    end 


    def history(input)
        if input == "y"
            display_all_beers
            loop_or_exit
        else
            exit 
        end 
    end 
end 
