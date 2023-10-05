seed = rrand(0,100)

live_loop :euclid_beat do
  sample :drum_cymbal_closed, amp: 2 if (spread 3, 8).tick
  sample :drum_bass_soft, amp: 2 if (spread 5, 9).look
  sample :drum_cymbal_pedal, amp: 2 if (spread 3, 7, rotate:1).look
  sample :drum_heavy_kick, amp: 2 if (spread 1, 4).look
  sleep 0.125
end

live_loop :wtf do
  use_random_seed seed
  notes = (chord :C, :minor7, num_octaves: 4).shuffle
  use_synth :mod_fm
  play notes.take(12).tick, amp: 0.4
  sleep 0.25
end

live_loop :bajo do
  sample :bass_drop_c, amp: 4
  seed = rrand(0,100)
  sleep 12
end