use_bpm 70

live_loop :ringo do
  sleep 4
end

live_loop :billy, sync: :ringo do
  tick
  sample :bd_zum if factor?(look,4)
  sample :elec_blup if spread(5,8).look
  with_fx :krush, mix: rand, cutoff: rrand(70,120) do
    ##| with_fx :echo, decay: 0.5, phase: [0.25,0.125].choose, mix: [0,1].choose do
    if spread(9,16).look
      in_thread do
        [1,1,1,2,4].choose.times do
          density [1,0.5,0.25].choose do
            sample 'D:\Sonic Pi samples\Moog_Kick', 2,
              pitch: 0,
              pitch_dis: 0.5,
              rpitch: [0,3,6,12,24,48,96].choose
            sleep 0.125
          end
        end
      end
    end
    ##| end
  end
  sleep 0.125
end

live_loop :chris, sync: :ringo do
  tick
  use_random_seed 5690
  32.times do
    with_fx :distortion, distort: [0.7,0.8,0.9].choose do
      with_fx :flanger, feedback: [0.4,0.8,0.2,0.2].choose do
        with_fx :panslicer do
          sample "D:/Sonic Pi samples/BassB_120A-03.wav",
            onset: pick,
            rpitch: [0,3,6,12].choose,
            amp: 1 unless one_in(3)
          sleep 0.125
        end
      end
    end
  end
end

live_loop :john, sync: :ringo do
  with_fx :flanger, phase: [0.125,0.25,0.5,1,2].choose, depth: [5,10,20,40,80].choose, feedback_slide: 0.1 do |fx|
    32.times do
      ##| control fx, feedback: rrand(0.5,1.5)
      with_fx :bitcrusher, mix: 0.8, bits: rrand_i(2,9) do
        synth :beep, note: :c6, release: [0.1,0.1,0.1,0.1,0.5,0.5,1].choose, amp: 0.4 unless one_in(3)
        sleep [0.125, 0.25].choose
      end
    end
  end
end


