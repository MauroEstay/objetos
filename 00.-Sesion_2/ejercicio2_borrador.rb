require 'date'

class Course
  attr_reader :name
  def initialize(name, dates_start, dates_end)
    @name = name
    @dates_start = Date.parse(dates_start)
    @dates_end = Date.parse(dates_end)
    # print @dates_end
    # @payments = payments.map{|date| Date.parse(date)}
    # puts @name.class
    #puts @dates_start.class
    # puts @dates_end.class
    # puts Date.parse(@dates_start).class
  end

  def datesBefore(filter_date)
    # raise ArgumentError.new('argument is not a date') if filter_date.class != Date
     if @dates_start < filter_date
    # puts @dates_start
      puts "El curso #{@name}, comenzo #{@dates_start} antes de #{filter_date}"
     end
  end

  def datesAfter(filter_date)
    # raise ArgumentError.new('argument is not a date') if filter_date.class != Date
    #@dates_end.select {|date| date < filter_date}
     if @dates_end > filter_date
    #   puts @dates_end
      puts "El curso #{@name}, terminara #{@dates_end} o sea despues de #{filter_date}"
     end
  end
end

file = File.open('cursos.txt', 'r')
data = file.readlines
file.close

course_list = []
data.each do |m|
  ls = m.split(', ')
  name = ls[0]
  dates_start = ls[1]
  dates_end = ls[2]
  course_list << Course.new(name, dates_start, dates_end)
end

# puts "Los cursos que comienzan antes de la fecha de hoy #{Date.today} son: "
# course_list.each do |course|
#    print " El curso #{course.name} comienza el "
#    print course.datesBefore(Date.today)
#   # puts "#{course.name}, #{course.datesBefore(Date.today)}"
#   # puts "Los cursos que comienzan antes de #{Date.today} son: " 
#   #puts "El curso #{course.name} empieza el #{course.datesBefore(Date.today)}"
#   #puts "#{course.datesBefore(Date.today)}"
# end
# puts ""
# puts "Los cursos que terminan despues de la fecha de hoy #{Date.today} son: "
# course_list.each do |course|
#    print " El curso #{course.name} termina el "
#    print course.datesAfter(Date.today)
# end

 course_list.each do |course|
  print "#{course.datesBefore(Date.today)}"
  print course.datesAfter(Date.today)
 end

# print course_list[0].datesBefore(Date.today)
# print course_list[1].datesBefore(Date.today)
# print course_list[2].datesBefore(Date.today)
# print course_list[3].datesBefore(Date.today)
# print course_list[4].datesBefore(Date.today)
# print course_list[0].datesAfter(Date.today)
# print course_list[1].datesAfter(Date.today)
# print course_list[2].datesAfter(Date.today)
# print course_list[3].datesAfter(Date.today)
# print course_list[4].datesAfter(Date.today)
