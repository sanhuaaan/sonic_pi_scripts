live_loop :euclidean_overlap do
  sample :drum_cymbal_closed if (spread 3,8).tick
  sample :drum_bass_soft if (spread 7,16).look
  sample :drum_cymbal_pedal if (spread 12,20).look
  sample :drum_heavy_kick if (spread 1,4).look
  sample :drum_tom_lo_soft if (spread 5,16).look
  sample :drum_cowbell, amp: 0.25 if (spread 5,12).look
  
  
  sleep 0.125
end
