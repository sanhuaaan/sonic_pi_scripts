load'D:\Sonic Pi samples\petal-master\petal.rb'

bpm(120)
with_fx :bitcrusher, bits: '4', mix: 1 do
  d1 'bd(5,8,2)', speed: 1, n: 3, speed: 'rand 0.5 2.5'
end
with_fx :krush, cutoff: 100 do
  d2 'sn sn/4 ~ sn:2', speed: 1, pan: 'rand -1 1', speed: '0.5 1 2 1 0.5'
  d3 'arpy hh/2', speed: 0.25, n: 'irand 3'
end

##| hush

live_loop :ringo do
  sleep 2
end

live_loop :future_past, sync: :ringo do
  ##| stop
  if rand < 0.5
    use_bpm [60,60,30].ring.tick(:bpm)
    with_fx :tanh, amp: 0.6 do |fx|
      16.times do
        control fx, krunch: rrand(0,40)
        synth :fm, note: [72,60,66].choose, release: 0.1 unless one_in(3)
        sleep 0.125
      end
    end
  else
    use_bpm 60
    n=[6,9,11].choose
    with_fx :reverb, room: 1 do
      with_fx :echo, phase: 0.125 do |e|
        16.times do
          control e, mix: [0,1].choose
          sample [:elec_blup, :elec_blip].choose, rpitch: [0,1.5,3,6].choose if spread(n,16).tick
          sleep 0.125
        end
      end
    end
  end
end
