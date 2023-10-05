loop do
  for i in 0..7
    m=1<<i
    sample 17 if 171&m>0
    sample 15 if 68&m>0
    sample 13 if 85&m>0
    sample 68 if 3&m>0
    sleep 0.2
  end
end