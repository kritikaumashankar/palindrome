require 'httparty'
require 'pry'
require 'json'

url = 'http://json-server.devpointlabs.com/api/v1'
response = HTTParty.get(url)
response.parsed_response


  def menu
    puts "User Menu"
    puts "1) Display List of Users"
    puts "2) Select A User"
    puts "3) Add A User"
    puts "4) Update A User"
    puts "5) Delete A User"
    puts "6) Exit"

    user_input = gets.to_i

    case user_input
      when 1
        display_users
      when 2
        select_user
      when 3
        add_user
      when 4
        update_user
      when 5
        delete_user
      when 6
        puts "GoodBye!"
        exit
      else
        puts "Invalid Input"
        menu
    end
    menu
  end

  def display_users
    url = 'http://json-server.devpointlabs.com/api/v1/users'
    response = HTTParty.get(url)
    userArr = response.parsed_response
    userArr.each_with_index do |user|
      puts "#{user['id']}    #{user['first_name']}    #{user['last_name']}   #{user['phone_number']}"
    end
  end

  def select_user
    puts "Enter the Id"
    user_input = gets.strip.to_i
    url = "http://json-server.devpointlabs.com/api/v1/users/#{user_input}"
    response = HTTParty.get(url)
    user = response.parsed_response
    puts "#{user['id']}    #{user['first_name']}    #{user['last_name']}   #{user['phone_number']}"
   end

   def add_user
    user={}
    puts "Enter the First Name"
    first_name = gets.strip.to_s
    puts "Enter the Last Name"
    last_name = gets.strip.to_s
    puts "Enter the Phone Number"
    phone_number = gets.strip.to_s
    url = "http://json-server.devpointlabs.com/api/v1/users/"
    response = HTTParty.post(url, body: {"user[first_name]": first_name, "user[last_name]": last_name, "user[phone_number]":phone_number})
    user = response.parsed_response
    if(user['id'])
      puts "#{user['id']}    #{user['first_name']}    #{user['last_name']}   #{user['phone_number']}"
    else
      puts "#{user.status}    #{user.error}"
    end
  end

  def update_user

    puts "Enter the Id"
    user_input = gets.strip.to_i
    url = "http://json-server.devpointlabs.com/api/v1/users/#{user_input}"
    response = HTTParty.get(url)
    user = response.parsed_response
    puts "#{user['id']}    #{user['first_name']}    #{user['last_name']}   #{user['phone_number']}"
    puts "Enter the First Name"
    first_name = gets.strip.to_s
    puts "Enter the Last Name"
    last_name = gets.strip.to_s
    puts "Enter the Phone Number"
    phone_number = gets.strip.to_s
    response = HTTParty.put(url, body: {"user[first_name]": first_name, "user[last_name]": last_name, "user[phone_number]":phone_number})
    user = response.parsed_response
    if(user['id'])
      puts "#{user['id']}    #{user['first_name']}    #{user['last_name']}   #{user['phone_number']}"
    else
      puts "#{user.status}    #{user.error}"
    end
  end

  def delete_user
    puts "Enter the Id"
    user_input = gets.strip.to_i
    url = "http://json-server.devpointlabs.com/api/v1/users/#{user_input}"
    response = HTTParty.get(url)
    user = response.parsed_response
    puts "#{user['id']}    #{user['first_name']}    #{user['last_name']}   #{user['phone_number']}"
   
    response = HTTParty.delete(url, body: {"user[id]": user_input})
    user = response.parsed_response
    puts "#{user['message']} "
  end

menu