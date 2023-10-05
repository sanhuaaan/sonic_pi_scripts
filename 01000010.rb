live_loop :awww_yeah do
  tick
  sample :bd_sone if factor?(look,4)
  time_warp [0.25,-0.25,0].choose do
    with_fx ((bools 0,1,0,0,0,0,1,0).look ? :bitcrusher : :none), bits: rrand_i(3,6) do
      density [1,1,2].ring.look do
        sample :elec_blup, rate: rrand(0.25,4), lpf: rrand(60,110)
        sleep 0.25
      end
    end
  end
  with_fx :echo, decay: 2 do
    sample :elec_ping if spread(5,16).look
  end
  if factor?(look,2)
    with_fx :wobble do
      time_warp [0,0.25,-0.25,0.125,-0.125].choose do
        density [0.5,1,1,1,2,2,4].choose do
          detune=rrand_i(1,7)*[1,-1].choose
          n=(chord :e4, '+5', num_octaves: 2).choose
          synth :tri,
            note: n,
            release: [0.2,0.5].choose,
            note_slide: 0.25,
            amp: 0.7 if spread(5,7).look
          control note: 60+detune
          sleep 0.25
        end
      end
    end
  end
  sleep 0.125
end

