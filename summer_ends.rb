use_bpm 120
folder="/home/jsanjuan/musicradar-808-samples/Hits/"
defonce :novation do
  {
    'ringo_1' => false
  }
end


live_loop :ringo do
  ##| stop
  in_thread do
    8.times do
      tick
      density [1,1,1,1,1,1,2].choose do
        on spread(5,8).look do
          sample folder + "Claves [CL]/E808_CL-01.wav", amp: 0.7, cutoff: 100 unless one_in(4)
        end
        sleep 0.5
      end
    end
  end
  8.times do
    tick
    if factor? look, 2
      time_warp -0.2 do
        ##| midi_clock_beat port: 'ch345_ch345_midi_1_24_0'
      end
    end
    
    on [1,0,1,0,1,0,1,0].ring.look do
      if novation['ringo_1']
        sample folder + "Bass Drum [BD]/E808_BD[short]-03.wav", amp: 2
      end
    end
    on [0,0,0,1,0,0,0,1].ring.look do
      with_swing -0.25, pulse: 2 do
        sample folder + "Snare Drum [SD]/E808_SD-02.wav", amp: 0.5
      end
    end
    on [0,1,0,0].ring.look do
      sample folder + "Closed Hi Hat [CH]/E808_CH-01.wav"
    end
    on [1,0,0,0,0,0,0,0].ring.look do
      sample folder + "Open Hi Hat [OH]/E808_OH-03.wav", finish: 0.2, amp: 0.7
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
    time_warp -0.15 do
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

live_loop :loop_control do
  use_real_time
  val, velocity = sync "/midi*9/note_on"
  case val
  when 9
    novation['ringo_1'] = !novation['ringo_1']
    print 'ringo_1 ' + String(novation['ringo_1'])
  end
end


