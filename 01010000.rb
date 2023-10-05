live_loop :ringo do
  sleep 4
end

live_loop :john, sync: :ringo do
  ##| stop
  ##| use_random_seed 250
  4.times do
    with_fx :distortion, distort: 0.8 do
      if rand<0.8
        with_fx :compressor do
          with_fx :slicer, mix: [0,0,1].choose do
            sample "D:/Sonic Pi samples/Synth_Perc_loop_"+["20","21","22"].choose+"(130BPM).wav",
              num_slices: 16,
              beat_stretch: [4,4,8].choose,
              rate: [-1,1].choose,
              slice: pick,
              amp: 0.7
          end
        end
        sleep 4.0/[32,16].choose
      else
        in_thread do
          with_fx :echo, decay: [2,4].choose, phase: 4.0/[8,16,32].choose, mix: [0,1,1].choose do
            density [2,4].choose do
              synth :blade, note: (octs :d1, 5).choose, release: [0.2].choose, pan: [1,-1].choose
              sleep [0.5,1].choose
            end
          end
        end
        sleep 4.0/16
      end
    end
  end
end

live_loop :billy, sync: :ringo do
  ##| stop
  sample "D:/Sonic Pi samples/Moog_Misc", 7 if spread(11,24).look
  if spread(9,16).tick
    [1,2,3].choose.times do
      sample "D:/Sonic Pi samples/Moog_Misc", 1, env_curve: 7, rpitch: rrand(0.3,2.4)
      sleep 0.125
    end
  else
    sleep 0.125
  end
end

live_loop :billy_f, sync: :ringo do
  ##| stop
  sample "D:/Sonic Pi samples/Moog_Kick", 3
  sleep 0.5
end

live_loop :chris, sync: :ringo do
  ##| stop
  tick unless one_in(3)
  synth :chipbass, note: (octs :c3, 3).look, release: 0.1
  sleep [0.125,0.125,0.25].choose
end
