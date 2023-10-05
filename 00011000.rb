bpm = 50

live_loop :Roy do
  use_bpm bpm
  sleep 0.125
  13.times do
    if spread(9,13).tick(:a)
      sample :drum_tom_mid_soft
    else
      sample :drum_cymbal_closed
    end
    sleep 0.125
  end
  4.times do
    sleep 0.125
    sample :drum_tom_lo_hard if spread(1,2).tick(:b)
  end
end

live_loop :Pris do
  use_bpm bpm
  use_random_seed 6
  sleep 0.125
  13.times do
    sample :bass_drop_c, rate: rrand(0.7,4)+0, amp: 0.8
    sleep 0.125
  end
  4.times do
    sleep 0.125
    sample :bass_voxy_hit_c
  end
end
