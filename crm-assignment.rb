Skip to content
This repository
Search
Pull requests
Issues
Gist
 @sathesbitmaker
 Watch 0
  Star 0
 Fork 25 sathesbitmaker/crm-assignment
forked from bitmakerlabs/crm-assignment
 Code  Pull requests 0  Projects 0  Wiki  Pulse  Graphs  Settings
Branch: master Find file Copy pathcrm-assignment/crm.rb
f6dee13  30 minutes ago
@sathesbitmaker sathesbitmaker finallydone
4 contributors @fredngo @sathesbitmaker @NatalieBlack @fightingtheboss
RawBlameHistory
111 lines (90 sloc)  2.3 KB
require_relative "contact"

class CRM

  def initialize

  end

    def main_menu
  while true # repeat indefinitely
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end
    end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Search by attribute"
    puts "[6] Exit"
    puts "[7] Enter a number:"
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_a_new_contact
    when 2 then modify_an_existing_contact
    when 3 then delete_a_contact
    when 4 then display_all_the_contacts
    when 5 then search_by_attribute
    when 6 then abort ("exit")

    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    contact = search_by_attribute
    if contact == nil
      return "I could not find a contact to modify"
    else
      puts "What would you like to change?"
      puts "[1] First Name"
      puts "[2] Last Name"
      puts "[3] Email"
      puts "[4] Note"
      field = gets.chomp.to_i
      case field
      when 1 then puts "What is your first name?"
        first_new_name = gets.chomp
        contact.first_name = first_new_name
      when 2
        puts "What is you last name?"
        last_new_name = gets.chomp
        contact.last_name = last_new_name
      when 3
        puts "What is you email?"
        email_new = gets.chomp
        contact.email= email_new
      when 4
        puts "What is your note?"
        note_new = gets.chomp
        contact.note= note_new
        end
      end
    end


  def delete_contact
    @@contacts.delete(self)
  end

  def display_all_contacts
    @@contacts

  end

  def search_by_attribute
    puts "What attribute would you like to search?"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Note"

    case user_selected
 when 1 then puts "What is your first name?"
   search_attr = Contact.find_by(:firstname)
   puts "#{search_attr}"
 end
  end

end
