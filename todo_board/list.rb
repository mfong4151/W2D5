require_relative 'item'

class List

    attr_reader :label
    def initialize(label)
        @label = label
        @items = []
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description='')

        if Item.is_valid?deadline
            @items << Item.new(title, deadline, description)
            true
        else
            false
        end

    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if (index < 0) or (index > @items.length - 1) or (@items.length == 0)
        true
    end

    def swap(index_1, index_2)
        index_1, index_2 = index_1.to_i, index_2.to_i
        return false if !valid_index?index_1 or !valid_index?index_2
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        @items[index]

    end

    def priority
        @items[0]
    end


    def print
        (0...@items.length).each do |i| 

            #puts i, i.to_s.class
            #puts @items[i].title 
            #puts  @items[i].deadline
            j = i.to_s
            puts j +' ' + @items[i].title + ' ' + @items[i].deadline + ' ' + @items[i].done.to_s
        end
    end

    def print_full_item(index)
        return false if !valid_index?(index)
        item = @items[index]
        puts item.title + ' ' + item.deadline + ' ' + item.description + ' ' + item.done.to_s
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        index, amount = index.to_i, amount.to_i
        amount.times do 
            return false if !valid_index?index - 1
            swap(index, index - 1)
            index -= 1
        end
        true
    end


    def down(index, amount=1)
        index, amount = index.to_i, amount.to_i
        amount.times do 
            return false if !valid_index?index + 1
            swap(index, index + 1)
            index += 1
        end
        true
    end

    def sort_by_date! #sorts with the latest deadline coming first
        @items = @items.sort_by!{|item| item.deadline}

    end

    def toggle_item(index)
        index = index.to_i
        @items[index].toggle
    end

    def remove_item(index)
        index = index.to_i

        return false if !valid_index?index

        @items.delete_at(index)
        true
    end

    def purge

        @items.length.times{remove_item(-1)}

    end
end