'??????'.each_codepoint{|c|use_random_seed(c)
  5.times do
    i=rrand_i(-1,4)
    play scale(:A3,:minor)[i] if i>=0
    sleep 0.25
end}