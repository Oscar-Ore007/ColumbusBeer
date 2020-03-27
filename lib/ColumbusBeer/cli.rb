class ColumbusBeer::CLI
    def start 
        welcome
        puts "Welcome to the ColumbusBeer App!"
        puts "What kind of Beer are you having? Press any key to view our selection"
        input = gets.chomp.downcase 
        ColumbusBeer::API.get_beers
        menu 
    end 

    def menu 
        display_def
        more_options
        loop_or_exit
    end 

    def welcome 
        print "
        
 .o88b.  .d88b.  db      db    db .88b  d88. d8888b. db    db .d8888. d8888b. d88888b d88888b d8888b. 
 d8P  Y8 .8P  Y8. 88      88    88 88'YbdP`88 88  `8D 88    88 88'  YP 88  `8D 88'     88'     88  `8D 
 8P      88    88 88      88    88 88  88  88 88oooY' 88    88 `8bo.   88oooY' 88ooooo 88ooooo 88oobY' 
 8b      88    88 88      88    88 88  88  88 88~~~b. 88    88   `Y8b. 88~~~b. 88~~~~~ 88~~~~~ 88`8b   
 Y8b  d8 `8b  d8' 88booo. 88b  d88 88  88  88 88   8D 88b  d88 db   8D 88   8D 88.     88.     88 `88. 
  `Y88P'  `Y88P'  Y88888P ~Y8888P' YP  YP  YP Y8888P' ~Y8888P' `8888Y' Y8888P' Y88888P Y88888P 88   YD 
                                                                                                       
                                                                                                       
 ".light_black

 puts "
 <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
 ".red 
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
       
            if input.between?(1,10)
            #I need to check to make sure its a valid index
        index = input - 1 
        #I need to check to make sure its a valid index, if its not, they should restart the more options method 
        user_choice = ColumbusBeer::Beers.all[index]
        sleep (1)
        puts "Great choice! You selected: #{user_choice.name}".light_cyan
        puts "--------------------------------------------------------".light_black
        sleep (1)
        puts "Here is a description of your brew:" 
        sleep (1)
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>".light_red
        puts "#{user_choice.description}"

            else 
                puts "........ Have you had to much to drink already?"
                puts "Sorry, I didn't understand that. Please select a number between 1-10"
                puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>".light_green
                sleep(2)
                display_def
                more_options
        end 
    end

    def exit 
        sleep(1)
        puts "See ya next time, stay safe and tell you friends about us! O...H".light_red 
        puts "I.....O".light_black
    end 

    def loop_or_exit 
        puts "####################################################".light_black
        puts "Would you like to have another beer? Enter y/n"
        input = gets.chomp.downcase 
        if input == "y"
            sleep (1)
            menu 
        else 
        #    puts "Would you like to see your previous beer choices? Type y/n" 
        #    new_input = gets.chomp.downcase 
        #    history(new_input)
           exit 
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
        # else
        #exit 
        end 
    end 
end 
