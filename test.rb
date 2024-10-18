
x = 10000000.99
pp x.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
