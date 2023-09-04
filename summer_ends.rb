use_bpm 95
folder="/home/jsanjuan/musicradar-808-samples/Hits/"

live_loop :ringo do
  ##| stop
  8.times do
    tick
    
    if factor? look, 2
      time_warp -0.2 do
        midi_clock_beat port: 'ch345_ch345_midi_1_24_0'
      end
    end
    
    on [1,0,0,0,0,1,0,0].ring.look do
      sample folder + "Bass Drum [BD]/E808_BD[short]-01.wav"
    end
    on [0,1,0,1,0,0,1,0].ring.look do
      sample folder + "Claves [CL]/E808_CL-01.wav"
    end
    with_swing 0.25, pulse: 3 do
      on [0,1,0,0,0,0,1,0].ring.look do
        sample folder + "Maracas [MA]/E808_MA-02.wav", amp: 0.6
      end
    end
    on [0,1].ring.look do
      sample folder + "Closed Hi Hat [CH]/E808_CH-03.wav"
    end
    on [1,0,0,0,1,0,0,0,0,0].ring.look do
      sample folder + "Snare Drum [SD]/E808_SD-17.wav"
    end
    sleep 0.5
  end
end

live_loop :paul, sync: :ringo do
  stop
  use_random_seed 555
  8.times do
    on spread(6,10).tick do
      #Bass - CM Subsine
      time_warp 0.25 do
        midi octs(:b1, 4).choose,
          port: 'midi_through_midi_through_port-0_14_0',
          sustain: 0.2
      end
    end
    cue :paul
    sleep 0.5
  end
end

live_loop :john, sync: :ringo do
  stop
  4.times do
    i=[0,2,3,4].ring.tick
    time_warp -0.25 do
      midi scale(:b2, :major)[i],
        port: 'ch345_ch345_midi_1_24_0',
        sustain: 9
    end
    sleep 8
  end
end

live_loop :george, sync: :ringo do
  stop
  use_random_seed 697
  16.times do
    with_swing -0.5 do
      time_warp -0.25 do
        midi chord(:b, :M, num_octaves: 2).choose,
          port: 'nts-1_digital_kit_nts-1_digital_kit_nts-1_digital_28_0',
          sustain: 1 if one_in(3)
      end
    end
    sleep 1
  end
end


