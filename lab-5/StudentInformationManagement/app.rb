# app.rb
require 'sinatra'

#use `set` to store your fashion‐school roster
set :students_info, [
  { id:  1, student_id: 1001, name: 'Adriana Lima',          gpa: 4.0, image: '/images/Adriana Lima.jpeg'         },
  { id:  2, student_id: 1002, name: 'Alex Consani',         gpa: 4.0, image: '/images/alex consani.png'         },
  { id:  3, student_id: 1003, name: 'Alexander McQueen',    gpa: 4.0, image: '/images/Alexander McQueen.png'    },
  { id:  4, student_id: 1004, name: 'Gianni Versace',       gpa: 4.0, image: '/images/Gianni Versace.png'       },
  { id:  5, student_id: 1005, name: 'John Galliano',        gpa: 4.0, image: '/images/John Galliano.png'        },
  { id:  6, student_id: 1006, name: 'Kate Moss',            gpa: 3.9, image: '/images/kate moss.png'            },
  { id:  7, student_id: 1007, name: 'Marc Jacobs',          gpa: 3.8, image: '/images/Marc Jacobs.png'          },
  { id:  8, student_id: 1008, name: 'Tom Ford',             gpa: 4.0, image: '/images/tom ford.jpg'             },
  { id:  9, student_id: 1009, name: 'Virgil Abloh',         gpa: 3.7, image: '/images/Virgil Abloh.png'         },
  { id: 10, student_id: 1010, name: 'Vivienne Westwood',    gpa: 3.7, image: '/images/Vivienne Westwood.png'    },
  { id: 11, student_id: 1011, name: 'Yasmin Wijnaldum',     gpa: 3.9, image: '/images/yasmin wijnaldum.png'      },
  { id: 12, student_id: 1012, name: 'Yves Saint Laurent',   gpa: 4.0, image: '/images/Yves Saint Laurent.png'   }
]


#helpers to look up students
helpers do
  def all_students
    settings.students_info
  end

  def find_by_id(id)
    all_students.find { |s| s[:id] == id.to_i }
  end

  def find_by_name(query)
    all_students.select { |s| s[:name].downcase.include?(query.to_s.downcase) }
  end
end

#routes
get '/' do
  @custom_css = 'index.css'
  erb :index
end

get '/about' do
  @custom_css = 'about.css'
  erb :about
end

get '/students' do
  @custom_css = 'students.css'
  @students = all_students
  erb :students
end

get '/students/:id' do
  @custom_css = 'students.css'
  @student = find_by_id(params[:id])
  pass unless @student
  erb :student
end

get '/search' do
  @custom_css = 'search.css'
  erb :search
end

post '/search' do
  @custom_css = 'search.css'
  @query   = params[:name]
  @results = find_by_name(@query)
  erb :search
end

get '/count' do
  @custom_css = 'count.css'
  @total = all_students.size
  erb :count
end
