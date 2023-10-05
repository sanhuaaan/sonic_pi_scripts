live_loop :ringo do
  sleep 3.0/4
end

live_loop :gotta_light?, sync: :ringo do
  with_fx :reverb, room: 1 do
    with_fx :flanger, feedback: 0.8, mix: 0 do
      with_fx :panslicer, phase: 3.0/[4,2,1].choose  do
        density [0.5,0.5,1,2].choose do
          sample 'D:\Sonic Pi samples\07(130BPM).wav',
            pitch: rrand(0,1.5),
            num_slices: 4,
            slice: pick,
            beat_stretch: [3,6,9].choose
          sleep [1.5,3.0,3.0,3.0].choose/4
        end
      end
    end
  end
end

live_loop :drink_full_and_descend, sync: :ringo do
  tick
  with_fx :wobble, phase: 3.0/16 do
    sample :bd_ada, amp: 3
    density [1,2,3,4].choose do
      sample :drum_cymbal_soft, rate: 1.5 if spread(5,6).look unless one_in(3)
      sample [:drum_heavy_kick, :drum_tom_lo_soft].choose if spread(2,6).look unless one_in(3)
      if factor?(look,4)
        time_warp 0 do
          [1,2,3].choose.times do
            density [1,2].choose do
              sample [:drum_tom_mid_hard,:drum_tom_hi_soft,:drum_tom_lo_hard].choose, rate: rand unless one_in(2)
              sleep [3.0,6.0,9.0].choose/[4,2].choose
            end
            sleep 3.0/[4,2].choose
          end
        end
      end
      sleep 3.0/4
    end
  end
end

live_loop :kcor_s´tel, sync: :ringo do
  use_random_seed 50
  with_fx :ixi_techno, phase: 3.0/16 do
    with_fx :distortion, distort: 0.2 do
      8.times do
        sample 'D:\Sonic Pi samples\BassC_110A-02.wav', onset: pick, rate: 1
        sleep [3.0,1.5,6.0].choose/[4,8].choose
      end
    end
  end
end
