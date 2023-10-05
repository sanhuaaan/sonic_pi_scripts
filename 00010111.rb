#notes=[60,63,65]
notes=(chord :c, :major)#.take(2)
puts notes.length

live_loop :Pris do
  use_random_seed 14
  #with_fx :octaver do
  use_transpose [5,3,1,0].ring.tick(:note)
  f if tick(:f)%4==0
  16.times do
    #use_synth :blade
    play notes.choose, release: 0.2 if spread(6,16).tick
    #sample :drum_snare_soft, amp: 0.2 if spread(13,16).tick
    sample :bd_boom, amp: 3 if spread(4,16).look
    sleep 0.125
  end
  #end
end

live_loop :Roy, sync: :Pris do
  use_random_seed 3
  use_synth :beep
  with_fx :panslicer, mix: 0.8 do
    4.times do
      play notes.choose, release: 0.2, amp: 0.2
      sleep 0.125
      play notes.choose+8, release: 0.2, amp: 0.2
      sleep 0.125
    end
  end
end

use_random_seed 3
n=(chord :c, :major).shuffle.ring
live_loop :Zhora, sync: :Roy do
  ##| with_fx :slicer, mix: 0.7, phase: 0.5, probability: 0.9, amp_max: 1, wave: 3, amp_min: 0.2, phase_slide: 6 do |f|
  ##|   use_synth :prophet
  ##|   p = play n.tick(:n), release: 6, attack: 1, cutoff: 60, cutoff_slide: 3
  ##|   control p, cutoff: 120
  ##|   control f, phase: 0.01
  sleep [3,1,12].ring.tick(:s)
  ##| end
end

def f
  in_thread do
    with_synth :zawa do
      with_fx :reverb, mix: 0.5, room: 1 do
        17.times do
          play 60, release: 0.2, cutoff: rrand(60,90), amp: 0.3 #if rand<0.7
          sleep 0.125 #[0.125,0.25].choose
        end
      end
    end
  end
end