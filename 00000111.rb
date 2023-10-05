live_loop :bass do
  use_synth :zawa
  play (chord :C2, :major).choose, release: 0.125, cutoff: rrand(50, 130)
  sleep 0.125
end

live_loop :dded do
  sample :ambi_drone
  sleep 1
end

live_loop :drums do
  sample :drum_cymbal_soft
  sleep 1
  
end
