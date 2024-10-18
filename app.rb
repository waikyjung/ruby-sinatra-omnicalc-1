require "sinatra"
require "sinatra/reloader"
require "active_support/core_ext"

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

get("/random/new") do
  erb(:random)
end

get("/square/new/results") do
  @cal_title = "Square"
  @cal_type = "square"
  @cal_path = "square"
  
  number = params.fetch("number").to_i
  square = number ** 2.to_f

  @results = []
  @results.push(["Number", number])
  @results.push(["Square", square])
  erb(:results)
end

get("/square_root/new/results") do
  @cal_title = "Square Root"
  @cal_type = "square root"
  @cal_path = "square_root"
  
  number = params.fetch("number").to_i
  square_root = number ** 0.5.to_f

  @results = []
  @results.push(["Number", number])
  @results.push(["Square Root", square_root])
  erb(:results)
end

get("/payment/new/results") do
  @cal_title = "Payment"
  @cal_type = "payment"
  @cal_path = "payment"
  
  apr = params.fetch("apr").to_f
  years = params.fetch("years").to_i
  principal = params.fetch("principal").to_f

  r = (apr / 100)/12
  n = years * 12
  monthly_payments = principal * (r * (1 + r) ** n) / ((1 + r) ** n - 1)
  
  @results = []
  @results.push(["APR", apr.to_fs(:percentage, { :precision => 4 } )])
  @results.push(["Number of years", years])
  @results.push(["Principal", principal.to_fs(:currency)])
  @results.push(["Monthly Payments", monthly_payments.to_fs(:currency)])

  erb(:results)
end

get("/random/new/results") do
  @cal_title = "Random"
  @cal_type = "random"
  @cal_path = "random"
  
  minimum = params.fetch("minimum").to_f
  maximum = params.fetch("maximum").to_f
  random_number = rand(minimum..maximum)

  @results = []
  @results.push(["Minimum", minimum])
  @results.push(["Maximum", maximum])
  @results.push(["Random Number", random_number])
  erb(:results)
end
