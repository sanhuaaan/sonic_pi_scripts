load'D:\Sonic Pi samples\petal-master\petal.rb'
cps(0.5)
d1 '808hc(9,16,3)', n: 3, amp: 1
d2 'bd*4', amp: 1.5
d3 'hh(5,16)', n: 10, amp: 1.5
d4 '[casio*2 ~ ~ ~ ~]/2'

live_loop :ringo do
  sleep 1
end

live_loop :tweak_em_gently, sync: :ringo do
  ##| stop
  use_synth_defaults amp: 0.3,
    release: 0.1,
    cutoff_attack: 0.05,
    cutoff_min: 80,
    cutoff: 90
  ctff2=120
  
  with_fx :reverb, mix: 0.5, room: 1 do
    with_fx :ixi_techno, res: 0.9, mix: 0 do
      with_fx :krush, gain: 1, cutoff: 80, res: 0.8, mix: 0 do
        dtn=12
        16.times do
          n=(octs :c1, 3).tick
          ##| unless one_in(4)
          synth :tb303, note: n
          synth :tb303, note: n+dtn, wave: 1, cutoff: ctff2
          ##| end
          sleep 0.125
        end
        ##| 2.times do tick end
        use_random_seed 780
        16.times do
          dtn=rrand_i(0,48)
          n2=(chord :c1, '+5', num_octaves: 2).choose
          ##| unless one_in(4)
          synth :tb303, note: n2
          synth :tb303, note: n2+dtn, wave: 1, cutoff: ctff2
          ##| end
          sleep 0.125
        end
      end
    end
  end
end



