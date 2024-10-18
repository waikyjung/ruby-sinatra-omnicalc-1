require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/payment/new") do
  erb(:payment)
end
  
get("/square/new/results") do
  @cal_title = "Square"
  @cal_type = "square"
  @cal_path = "square"
  @results = []
  number = params.fetch("number").to_i
  @results.push(["Number", number])
  square = number ** 2.to_f
  @results.push(["Square", square])
  erb(:results)
end

get("/square_root/new/results") do
  @cal_title = "Square Root"
  @cal_type = "square root"
  @cal_path = "square_root"
  @results = []
  number = params.fetch("number").to_i
  @results.push(["Number", number])
  square_root = number ** 0.5.to_f
  @results.push(["Square Root", square_root])
  erb(:results)
end

get("/payment/new/results") do
  @cal_title = "Payment"
  @cal_type = "payment"
  @cal_path = "payment"
  @results = []
  number = params.fetch("apr")
  @results.push(["APR", apr])
  years = params.fetch("year").to_i
  @results.push(["Number of years", years])
  principal = params.fetch("principal").to_f.round(2)
  @results.push(["Principal", principal])
  erb(:results)
end
