load'D:\Sonic Pi samples\petal-master\petal.rb'
cps(1)

d1 'bd(5,8,2)'

with_fx :bitcrusher do |f|
  d2 'sn [sn/4 ~] sn:2 [casio:1*2]', speed: '-1 2 2 rand 0.5 1 0.25', pan: 'rand -1 1'
  live_loop :controlBit do
    control f, bits: [2,8].choose, mix: [0,1,1].choose
    sleep 0.25
  end
end

with_fx :echo do |e|
  d3 '808oh ~ bleep*2 ~', speed: 'rand 0.5 2'
  live_loop :controlEcho do
    control e, phase: [0.125,0.5].choose, decay: [1,2,3,4].choose, mix: [0,1].choose
    sleep 0.25
  end
end

live_loop :bassline do
  use_random_seed 50
  with_fx :distortion, distort: 0.7 do
    16.times do
      synth :chipbass, note: (chord :c2, '+5', num_octaves: 2).choose, release: [0.1,0.1,0.5].choose
      sleep 0.125
    end
  end
end
