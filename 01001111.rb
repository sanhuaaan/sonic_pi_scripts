live_loop :ringo do
  sleep 8
end

live_loop :billy_bd, sync: :ringo do
  stop
  sample :bd_ada
  sleep 1
end

live_loop :billy, sync: :ringo do
  stop
  with_fx :echo, decay: 3 do |e|
    control e, phase: [0.25,0.5].choose
    sample :elec_ping if spread(3,8).tick
  end
  density [1,1,1,2,2,4].choose do
    sample :elec_twang, amp: 0.6, lpf: 90 if spread(7,9).tick
    sleep 0.5
  end
end

live_loop :billy_l, sync: :ringo do
  stop
  with_fx :reverb do
    4.times do
      sample "D:/Sonic Pi samples/AC_MachineDrumsB_95-01.wav", num_slices: 8, slice: pick, beat_stretch: 4, amp: 1.5
      sleep 3.0/8
    end
  end
end

live_loop :chris, sync: :ringo do
  stop
  with_fx :bitcrusher, bits: 8 do
    with_fx :distortion, distort: 0.3 do
      8.times do
        tick
        synth :blade, note: (chord [:a,:d,:a,:d,:a,:d,:a,:e].ring.look, :minor), release: 1.5, attack: 0.5
        synth :chipbass, note: (chord [:a,:d,:a,:d,:a,:d,:a,:e].ring.look, :minor)-12, release: 1.5, attack: 0.5
        sleep 2
      end
    end
  end
end

live_loop :john, sync: :ringo do
  stop
  tick
  ##| use_random_seed [200,300].ring.look
  with_fx :reverb do
    with_fx :wobble, phase: 0.25, wave: 2, cutoff_min: 40 do |wb|
      with_fx :krush do |k|
        8.times do
          control wb, cutoff_max: rrand(90,120), phase: [0.125,0.25,0.5].choose
          control k, cutoff: rrand(90,120)
          density [1,1,2,2,0.5].choose do
            synth [:gnoise,:blade,:blade,:blade].choose, note: (chord [:a3,:d3].ring.look, :major).choose, release: [0.2,0.4].choose, amp: 0.8 unless one_in(4)
            sleep 0.25
          end
        end
      end
    end
  end
end


