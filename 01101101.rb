with_fx :reverb, room: 1 do
  
  live_loop :picoloop do
    use_bpm 65
    4.times do
      time_warp -0.04 do
        midi_clock_beat
      end
      sleep 0.5
    end
  end
  with_fx :level, amp: 10 do
    live_audio :pico
  end
  
  #5E 5E 5E 5E
  
  live_loop :iuiu, sync: :picoloop do
    use_bpm 65
    ##| with_fx :ixi_techno, phase: 2 do
    with_fx :bitcrusher, bits: rrand(3,8) do |b|
      n=dice(12)
      12.times do
        control b, mix: [0,1].choose
        tick
        synth :blade, amp: 0.7, cutoff: rrand(80,100),
          note: (chord :e4, :minor, num_octaves: 2).choose,
          release: [0.1, 0.5, 0.1].choose if spread(7,12).look
        synth :chipbass, amp: 0.8, note: (chord :e3, :minor).choose,
          release: 0.1 if spread(n,12).look
        sleep 0.125
      end
    end
    ##| end
  end
  
  live_loop :jkjk, sync: :picoloop do
    use_bpm 65
    with_fx :wobble, cutoff_max: [110,100,95].choose,
    cutoff_min: rrand(70,90), probability: 0.7 do
      with_fx :krush, mix: [0,1].choose do
        12.times do
          density [1,2,2].choose do
            sample "C:/Users/jsanjuan/Desktop/GuitarB_80E-02.wav",
              rate: [0.25,1,1].choose, amp: 0.7, onset: pick,
              rpitch: [0,12].choose
            sleep 0.25
          end
        end
      end
    end
  end
  
  
end