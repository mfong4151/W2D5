require_relative 'item'
require_relative 'list'

class TodoBoard
    def initialize(*labels)
        @lists = {}
        @list = List.new(labels[0])
    end

    def get_command

        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd ##These all need to be reconfigured to handle exceptions
        
        when 'mklist'
            @lists[*args] = List.new(*args)
            @list = @lists[*args]

        when 'ls'
            @lists.each{|k, v| puts k}

        when 'showall'
            @lists.each{|k, v| puts v}

        when 'changeList' #<takes extra arguments of the list label to change to
            if !@lists.has_keys?*args
                puts "That list doesn't exist, try again"
                return false

            end

            @list = @lists[*args]

        when 'mktodo' # <list_label>  <title> <deadline> <optional description>  #makes a todo with the given information
            @list.add_item(*args)
        when 'up' #<index> <optional amount>         #raises the todo up the list
            @list.up(*args)
            
        when 'down' # <index> <optional amount>         #lowers the todo down the list
            @list.down(*args)

        when 'swap' #<index_1> <index_2>             #swaps the position of todos
            @list.swap(*args)

        when 'sort'                                 #sorts the todos by date
            @list.sort_by_date!
        when 'priority'                             #prints the todo at the top of the list
            @list.print_priority

        when 'print' #<optional index>              # prints all todos if no index is provided
            @list.print

        when 'quit'                                 #  returns false
            return false

        when 'toggle'
            @list.toggle_item(*args)

        when 'rm' #<index>
            @list.remove_item(*args)

        when 'purge'
            @list.purge
        else
            print "Sorry, that command is not recognized."
        end

        true

    end
    
    def run
        flag = true
        while flag
            flag = get_command()            
        end

    end

end