live_loop :sf do
  [1,2,3,4].each do |i|
    play (chord_degree 1, :c, :minor,3, invert: i)#.tick
    sleep 0.25
  end
end