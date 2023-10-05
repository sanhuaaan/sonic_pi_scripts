live_loop :sdf do
  tick
  density [1,0.5,2].choose do
    sample :drum_cymbal_soft, amp: 0.6 if spread(17,27).look
    sleep 0.125
  end
end

live_loop :sdfg do
  sample(spread(5,13).map{|s| s ? :drum_bass_hard : :drum_bass_soft}.tick)
  sleep 0.125
end

live_loop :asd do
  tick
  density 1 do
    if (x=(ring *%w{ 1 0 ~ 0
                     ~ 2 ~ 0
                     0 ~ 0 ~
                     1 0 ~ ~
                     ~ ~ 3 ~
                     ~ 0 ~ 0
                     ~ 0 4 0
                     0 ~ 5 2}).look) != '~'
      synth :fm, note: 60+x.to_i, release: 0.5, depth: 20, divisor: 2, amp: 0.3
    end
    sleep 0.125
  end
end
