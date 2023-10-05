live_loop :sd do
  with_fx(spread(7,11).map{|s| s ? :slicer : :echo}.tick) do
    play 60
    sleep 1
  end
end

live_loop :ss do
  density [1,1,2,2,3].choose do
    sample :tabla_te1 if spread(5,8).tick
    sample :tabla_te_ne if spread(10,15).look
    sleep 0.25
  end
end

live_loop :sa do
  16.times do
    sample :elec_blip if spread(5,16,rotate: 3).tick
    sleep 0.25
  end
  11.times do
    sample :elec_blup if spread(7,11).tick
    sleep 0.25
  end
end
