require_relative 'list'
require_relative 'item'
require_relative 'todo_board'

#####################################Item::valid_date?(date_string)

#Item.valid_date?('2019-10-25') # true
#Item.valid_date?('1912-06-23') # true
#Item.valid_date?('2018-13-20') # false
#Item.valid_date?('2018-12-32') # false
#Item.valid_date?('10-25-2019') # false

########################################First test suite
#

#load 'item.rb' #true

#my_item = Item.new('Fix login page', '2019-10-42', 'It loads slow.') #RuntimeError: deadline is not valid

#my_item = Item.new('Fix login page', '2019-10-22', 'It loads slow.') #<Item:0x
       ## @deadline="2019-10-22",
       ## @description="It loads slow.",
       ## @title="Fix login page">

#my_item.title #"Fix login page"

#my_item.description = 'It loads waaaaaay too slow!' "It loads waaaaaay too slow!"

#my_item
 #<Item:0x
#        @deadline="2019-10-22",
#        @description="It loads waaaaaay too slow!",
#        @title="Fix login page">

#my_item.deadline = "10-23-2019" #RuntimeError: deadline is not valid

#my_item.deadline #"2019-10-22"

#my_item.deadline = "2019-10-23" # "2019-10-23"

#my_item.deadline # "2019-10-23"

#my_item
#<Item:0x
#    @deadline="2019-10-23",
#    @description="It loads waaaaaay too slow!",
#     @title="Fix login page">



##################################################Checkpoint up down all around#####################

#
#l = List.new('Groceries') #<List:0x00007fac66bedf38 @items=[], @label="Groceries">
#
#l.add_item('cheese', '2019-10-25') # true
#
#l.add_item('toothpaste', '2019-10-25') # true

#l.add_item('shampoo', '2019-10-24') # true

#l.add_item('candy', '2019-10-31') #true

#l.print  # nil

#0     | cheese               | 2019-10-25
#1     | toothpaste           | 2019-10-25
#2     | shampoo              | 2019-10-24
#3     | candy                | 2019-10-31

#l.down(0) # true

#l.print

#------------------------------------------
#Index | Item                 | Deadline
#------------------------------------------
#0     | toothpaste           | 2019-10-25
#1     | cheese               | 2019-10-25
#2     | shampoo              | 2019-10-24
#3     | candy                | 2019-10-31
#------------------------------------------


#l.down(0, 2) #true

#l.print

#0     | cheese               | 2019-10-25
#1     | shampoo              | 2019-10-24
#2     | toothpaste           | 2019-10-25
#3     | candy                | 2019-10-31

#l.up(3, 10)


#l.print
#0     | candy                | 2019-10-31
#1     | cheese               | 2019-10-25
#2     | shampoo              | 2019-10-24
#3     | toothpaste           | 2019-10-25
#
#p l.up(7, 3) # invalid index 7 #=> false



###Test for List#sort_by_date!

#
#
#l = List.new('Groceries')  #<List:0x @items=[], @label="Groceries">
#
#l.add_item('cheese', '2019-10-25') # true
#
#l.add_item('toothpaste', '2019-10-25') #true
#
#l.add_item('shampoo', '2019-10-24') #true
#
#l.add_item('candy', '2019-10-31') # true

#l.print

#Index | Item                 | Deadline
#------------------------------------------
#0     | cheese               | 2019-10-25
#1     | toothpaste           | 2019-10-25
#2     | shampoo              | 2019-10-24
#3     | candy                | 2019-10-31
#------------------------------------------
#

#l.sort_by_date!
#<Item:0x @deadline="2019-10-24", @description="", @title="shampoo">,
 #<Item:0x @deadline="2019-10-25", @description="", @title="cheese">,
 #<Item:0x @deadline="2019-10-25", @description="", @title="toothpaste">,
 #<Item:0x @deadline="2019-10-31", @description="", @title="candy">]

#l.print
#------------------------------------------
#                GROCERIES
#------------------------------------------
#Index | Item                 | Deadline
#------------------------------------------
#0     | shampoo              | 2019-10-24
#1     | cheese               | 2019-10-25
#2     | toothpaste           | 2019-10-25
#3     | candy                | 2019-10-31
#------------------------------------------
#


####################Commands###############################################################
#my_board = TodoBoard.new('groceries')
#my_board.run
#mktodo cheese 2019-10-25 foooooood
#mktodo toothpaste 2019-10-23
#mktodo candy 2019-10-31 sugar-free
#mktodo shampoo 2019-10-25
#print

#GROCERIES
#------------------------------------------
#Index | Item                 | Deadline
#------------------------------------------
#0     | cheese               | 2019-10-25
#1     | toothpaste           | 2019-10-23
#2     | candy                | 2019-10-31
#3     | shampoo              | 2019-10-25
#------------------------------------------



#sort
#print

#------------------------------------------
#                GROCERIES
#------------------------------------------
#Index | Item                 | Deadline
#------------------------------------------
#0     | toothpaste           | 2019-10-23
#1     | cheese               | 2019-10-25
#2     | shampoo              | 2019-10-25
#3     | candy                | 2019-10-31
#------------------------------------------
#



#swap 0 3
#print
#print 1
#priority
#down 0
#print
#up 3 2
#print


#my_board = TodoBoard.new('groceries') #<TodoBoard:0x @list=#<List:0x @items=[], @label="groceries">>

#my_board.run

#Enter a command: mktodo cheese 2019-10-25 foooooood
#Enter a command: mktodo toothpaste 2019-10-23
#Enter a command: mktodo candy 2019-10-31 sugar-free
#Enter a command: mktodo shampoo 2019-10-25
#Enter a command: print
#------------------------------------------
                #GROCERIES
#------------------------------------------
#Index | Item                 | Deadline
#------------------------------------------
#0     | cheese               | 2019-10-25
#1     | toothpaste           | 2019-10-23
#2     | candy                | 2019-10-31
#3     | shampoo              | 2019-10-25
#------------------------------------------

#Enter a command: sort

#Enter a command: print
#------------------------------------------
                #GROCERIES
#------------------------------------------
#Index | Item                 | Deadline
#------------------------------------------
#0     | toothpaste           | 2019-10-23
#1     | cheese               | 2019-10-25
#2     | shampoo              | 2019-10-25
#3     | candy                | 2019-10-31
#------------------------------------------

#Enter a command: swap 0 3

#Enter a command: print
#------------------------------------------
                #GROCERIES
#------------------------------------------
#Index | Item                 | Deadline
#------------------------------------------
#0     | candy                | 2019-10-31
#1     | cheese               | 2019-10-25
#2     | shampoo              | 2019-10-25
#3     | toothpaste           | 2019-10-23
#------------------------------------------

#Enter a command: print 1
#------------------------------------------
#cheese                          2019-10-25
#foooooood
#------------------------------------------

#Enter a command: priority
#------------------------------------------
#candy                           2019-10-31
#sugar-free
#------------------------------------------

#Enter a command: lower 0
#Sorry, that command is not recognized.
#Enter a command: down 0

#Enter a command: print
#------------------------------------------
                #GROCERIES
#------------------------------------------
#Index | Item                 | Deadline
#------------------------------------------
#0     | cheese               | 2019-10-25
#1     | candy                | 2019-10-31
#2     | shampoo              | 2019-10-25
#3     | toothpaste           | 2019-10-23
#------------------------------------------

#Enter a command: up 3 2

#Enter a command: print
#------------------------------------------
                #GROCERIES
#------------------------------------------
#Index | Item                 | Deadline
#------------------------------------------
#0     | cheese               | 2019-10-25
#1     | toothpaste           | 2019-10-23
#2     | candy                | 2019-10-31
#3     | shampoo              | 2019-10-25
#------------------------------------------

#Enter a command: printerino
#Sorry, that command is not recognized.

#################################Checkpoint - Are we "done" yet?###############################################

my_board = TodoBoard.new('cool-tech-to-learn')
# #<TodoBoard:0x
#  @list=
#   #<List:0x
#    @items=[],
#    @label="cool-tech-to-learn">>

my_board.run

# Enter a command: mktodo ruby 2019-12-04
# Enter a command: mktodo sql 2019-12-20
# Enter a command: mktodo rails 2020-01-06
# Enter a command: mktodo javascript 2020-01-08
# Enter a command: mktodo react 2020-02-08
# Enter a command: mktodo redux 2020-02-15
# Enter a command: print
# -------------------------------------------------
#                 COOL-TECH-TO-LEARN
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | ruby                 | 2019-12-04 | [ ]
# 1     | sql                  | 2019-12-20 | [ ]
# 2     | rails                | 2020-01-06 | [ ]
# 3     | javascript           | 2020-01-08 | [ ]
# 4     | react                | 2020-02-08 | [ ]
# 5     | redux                | 2020-02-15 | [ ]
# -------------------------------------------------

# Enter a command: toggle 0

# Enter a command: print 0
# -------------------------------------------------
# ruby                            2019-12-04    [✓]

# -------------------------------------------------

# Enter a command: toggle 0

# Enter a command: print
# -------------------------------------------------
#                 COOL-TECH-TO-LEARN
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | ruby                 | 2019-12-04 | [ ]
# 1     | sql                  | 2019-12-20 | [ ]
# 2     | rails                | 2020-01-06 | [ ]
# 3     | javascript           | 2020-01-08 | [ ]
# 4     | react                | 2020-02-08 | [ ]
# 5     | redux                | 2020-02-15 | [ ]
# -------------------------------------------------

# Enter a command: toggle 0

# Enter a command: toggle 2

# Enter a command: toggle 3

# Enter a command: print
# -------------------------------------------------
#                 COOL-TECH-TO-LEARN
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | ruby                 | 2019-12-04 | [✓]
# 1     | sql                  | 2019-12-20 | [ ]
# 2     | rails                | 2020-01-06 | [✓]
# 3     | javascript           | 2020-01-08 | [✓]
# 4     | react                | 2020-02-08 | [ ]
# 5     | redux                | 2020-02-15 | [ ]
# -------------------------------------------------

# Enter a command: rm 4

# Enter a command: print
# -------------------------------------------------
#                 COOL-TECH-TO-LEARN
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | ruby                 | 2019-12-04 | [✓]
# 1     | sql                  | 2019-12-20 | [ ]
# 2     | rails                | 2020-01-06 | [✓]
# 3     | javascript           | 2020-01-08 | [✓]
# 4     | redux                | 2020-02-15 | [ ]
# -------------------------------------------------

# Enter a command: purge

# Enter a command: print
# -------------------------------------------------
#                 COOL-TECH-TO-LEARN
# -------------------------------------------------
# Index | Item                 | Deadline   | Done
# -------------------------------------------------
# 0     | sql                  | 2019-12-20 | [ ]
# 1     | redux                | 2020-02-15 | [ ]
# -------------------------------------------------


#####################################Final product##############



#Enter a command: mklist groceries
#Enter a command: mklist tech
#Enter a command: ls
# groceries
# tech

#Enter a command: mktodo groceries butter 2019-10-24
#Enter a command: mktodo groceries milk 2019-10-23
#Enter a command: mktodo groceries candy 2019-10-31 sugar-free
#Enter a command: mktodo groceries toothpaste 2019-10-29
#Enter a command: print groceries
#-------------------------------------------------
#                GROCERIES
#-------------------------------------------------
#Index | Item                 | Deadline   | Done
#-------------------------------------------------
#0     | butter               | 2019-10-24 | [ ]
#1     | milk                 | 2019-10-23 | [ ]
#2     | candy                | 2019-10-31 | [ ]
#3     | toothpaste           | 2019-10-29 | [ ]
#-------------------------------------------------#

#Enter a command: print groceries 2
#-------------------------------------------------
#candy                           2019-10-31    [ ]
#sugar-free
#-------------------------------------------------#

#Enter a command: mktodo tech ruby 2019-10-24
#Enter a command: mktodo tech rails 2019-11-02
#Enter a command: mktodo tech javascript 2019-11-30
#Enter a command: showall
#-------------------------------------------------
#                GROCERIES
#-------------------------------------------------
#Index | Item                 | Deadline   | Done
#-------------------------------------------------
#0     | butter               | 2019-10-24 | [ ]
#1     | milk                 | 2019-10-23 | [ ]
#2     | candy                | 2019-10-31 | [ ]
#3     | toothpaste           | 2019-10-29 | [ ]
#-------------------------------------------------
#-------------------------------------------------
#                TECH
#-------------------------------------------------
#Index | Item                 | Deadline   | Done
#-------------------------------------------------
#0     | ruby                 | 2019-10-24 | [ ]
#1     | rails                | 2019-11-02 | [ ]
#2     | javascript           | 2019-11-30 | [ ]
#-------------------------------------------------#

#Enter a command: toggle groceries 1
#Enter a command: toggle groceries 3
#Enter a command: toggle tech 2
#Enter a command: showall
#-------------------------------------------------
#                GROCERIES
#-------------------------------------------------
#Index | Item                 | Deadline   | Done
#-------------------------------------------------
#0     | butter               | 2019-10-24 | [ ]
#1     | milk                 | 2019-10-23 | [✓]
#2     | candy                | 2019-10-31 | [ ]
#3     | toothpaste           | 2019-10-29 | [✓]
#-------------------------------------------------
#-------------------------------------------------
#                TECH
#-------------------------------------------------
#Index | Item                 | Deadline   | Done
#-------------------------------------------------
#0     | ruby                 | 2019-10-24 | [ ]
#1     | rails                | 2019-11-02 | [ ]
#2     | javascript           | 2019-11-30 | [✓]
#-------------------------------------------------