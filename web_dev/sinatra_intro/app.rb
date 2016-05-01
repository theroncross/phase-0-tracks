# require gems
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

db = SQLite3::Database.new('students.db')
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute('SELECT * FROM students')
  response = ''
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute('SELECT * FROM students WHERE id=?', [params[:id]])[0]
  student.to_s
end

# Add a GET contact route
get '/contact' do
  'Come see us at 6100 Pennsylvania Ave, Washington D.C.'
end

# Add a GET great job route with default response
get '/great_job' do
  if params[:name]
    "Good job, #{params[:name]}!"
  else
    'Good job!'
  end
end

get '/add/:num1/:num2' do
  "#{params[:num1]} + #{params[:num2]} = #{params[:num1].to_i + params[:num2].to_i}"
end

# Must use %20 for spaces between names
get '/students_named/:name' do
  response = ''
  students = db.execute('SELECT * FROM students WHERE name=?', params[:name])
  students.each do |student|
    response << "Did you mean #{student['name']}, the "
    response << "#{student['age']} year old on the "
    response << "#{student['campus']} campus?"
  end
  response
end

