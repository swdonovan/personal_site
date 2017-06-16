require 'sinatra'
require 'sinatra/reloader'
require 'pry'

time = Time.now
set :first_message, first_message(time)
get '/' do
  message_one = settings.first_message
  erb :index, :locals => {:first_message => message_one }
end

def first_message(time)
  "Guess the number between 0 - 50"
  @number = number_generator(time)
end

def number_generator(time)
  day = time.strftime("%d").to_i
  year = year_convert(time.strftime("%y"))
  generate_random_number(day, year)
end

def year_convert(year)
  yr = year.each_char.to_a.inject(0) do |sum, num|
    sum + num.to_i
  end
  yr
end

private

def generate_random_number(day, year, time)
  first_num = (day.to_f / year.to_f).ceil
  sec_num = (day * year) / 70
  final = sec_num - first_num
end
