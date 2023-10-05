load'D:\Sonic Pi samples\petal-master\petal.rb'
bpm(50)
solo :d1, 'hh*2 808:2(3,4) ~ ~'
with_fx :echo, phase: 0.5, mix: 1 do
  with_fx :krush, cutoff: 90 do
    d2 '[bd sd:1 sd ~] cp:3'
  end
end

##| hush

##############################################

use_bpm 50

live_loop :ringo do
  sleep 4
end

live_loop :john, sync: :ringo do
  stop
  use_random_seed 100
  32.times do |i|
    with_fx :lpf, cutoff: 60 do
      with_fx :slicer, amp_min: 0.4, wave: 2 do
        synth :square, note: (chord :d3, :minor, num_octaves: 3).choose, release: 4.5 unless one_in(4) if i<17
      end
    end
    sleep 0.25
  end
end

live_loop :billy, sync: :ringo do
  stop
  f=rand
  n=[6,3,2].choose
  8.times do
    sample 'D:\Sonic Pi samples\Moog_Misc', 4, lpf: 80 if spread(5,8).tick
    sample 'D:\Sonic Pi samples\Moog_Misc', 8, lpf: 80 if spread(n,8).look if f<0.5
    sleep 0.25
  end
end

live_loop :chris, sync: :ringo do
  stop
  sleep [0,4].choose
  with_fx :echo, decay: [4,2,8].choose, phase: [0.25,0.5].choose do
    sample :drum_splash_hard, rate: -1, amp: 0.3, lpf: 110
  end
  sleep 8
end
