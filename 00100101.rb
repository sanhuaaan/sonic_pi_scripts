live_loop :beat do
  sample :loop_industrial
  use_synth :blade
  [1,3,4,5].each do |d|
    sample :drum_heavy_kick, amp: 2
    (range -2,2).each do |i|
      play_chord (chord_degree d, :c, :minor,1, invert: i)
      sleep 0.25
    end
  end
end

##| live_loop :cymbal do
##|   sample :drum_cymbal_soft
##|   play 1
##|   sleep 1
##| end

##| live_loop :lead do
##|   use_synth :chiplead
##|   [1,1,3,1,6,6,5,7].each do |d|
##|     (range -1,1).each do |i|
##|       play_chord (chord_degree d, :c, :minor,1,invert:i)
##|       sleep 0.25
##|     end
##|   end
##| end
