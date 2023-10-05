live_loop :garmonbozia do
  use_bpm 90
  tick
  density [1,2].choose do
    with_fx :echo, phase: 0.5, decay: 1 do
      with_fx :wobble do |fx|
        sample 'D:/Sonic Pi samples/loops/13(120BPM).wav',
          num_slices: 8, slice: pick, beat_stretch: 6, rate: 1, lpf: rrand(80,120)
        control fx, mix: 0 if one_in 3
      end
    end
    sleep 6.0/8
    sample :elec_pop, amp: 4, rate: rrand(0.6,1.5) if spread(6,9).look
  end
  if factor?(look,[8,16,32].choose)
    sample :elec_cymbal, rate: -1, beat_stretch: 3
    in_thread do
      sleep 3
      with_fx :reverb, room: 1 do
        sample :elec_blup, amp: 3
      end
    end
  end
  time_warp 0 do
    with_fx :gverb do
      sample :bd_haus, pan: [1,-1].ring.look
    end
    density [1,2].ring.look do
      [2,4,6].choose.times do
        synth :beep, note: (chord :d3, '9+5').choose, release: 0.5 unless one_in(3)
        sleep 0.25
      end
    end
  end
end

