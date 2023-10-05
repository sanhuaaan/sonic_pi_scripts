load'D:\Sonic Pi samples\petal-master\petal.rb'
cps(0.5)
d1 'bd:1*4'
d2 'hh(5,16) ~ [hh casio*2]/4 ~ [808*2]', n: 'irand(1,10)'
d3 'moog'


live_loop :from_the_lodge do
  use_synth [:dsaw,:dtri].choose
  n=(octs :c2, [3,4].choose)
  with_fx :reverb, room: 1 do
    with_fx :krush, cutoff: rrand_i(70,120), cutoff_slide: 0.5 do |fx_k|
      with_fx :octaver, super_amp: rrand(1,3), sub_amp: rrand(1,3) do |fx_o|
        with_fx :whammy, grainsize: [2,0,4,8,12].choose, deltime: rrand(0,7), transpose: rrand(0,96) do |p|
          t=rrand_i(1,8)
          play n.look,
            sustain: t,
            note_slide: 0.125,
            release: 0,
            detune: rrand(0,48)
          (t*8).times do |i|
            tick
            time_warp -0.125 do
              control note: n.look if spread((stretch 11,64,7,64).look,16).look
              control fx_k, cutoff: rrand_i(70,120) if factor?(i,8)
              control fx_o, super_amp: rrand(1,3), sub_amp: rrand(1,3)
            end
            sleep 0.125
          end
        end
      end
    end
  end
end