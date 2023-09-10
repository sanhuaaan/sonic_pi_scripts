use_bpm 120
folder="/home/jsanjuan/musicradar-808-samples/Hits/"
defonce :novation do
  {
    'ringo_1' => false,
    'ringo_2' => false,
    'ringo_3' => false,
    'ringo_4' => false,
    'ringo_5' => false,
    'ringo_6' => false,
    'paul' => false,
    'john' => false,
    'george' => false
  }
end
################################################
define :midi_chord do |notes, *args|
  notes.each do |note|
    midi note, *args,
      port: 'midi_through_midi_through_port-0_14_0'
  end
end
################################################

live_loop :ringo do
  ##| stop
  cue :ringo
  in_thread do
    16.times do
      tick
      density [1,1,1,1,1,1,2].choose do
        on spread(5,8).look do
          if novation['ringo_5']
            sample folder + "Claves [CL]/E808_CL-01.wav", amp: 0.7, cutoff: 100 unless one_in(4)
          end
        end
        sleep 0.5
      end
      on spread(11,16).look do
        if novation['ringo_6']
          time_warp -0.25 do
            sample folder + "Maracas [MA]/E808_MA-10.wav"
          end
        end
      end
    end
  end
  16.times do
    tick
    if factor? look, 2
      time_warp -0.15 do
        midi_clock_beat #port: 'ch345_ch345_midi_1_24_0'
      end
    end
    
    on [1,0,1,0,1,0,1,0].ring.look do
      if novation['ringo_1']
        with_swing -0.25, pulse: 4 do
          sample folder + "Bass Drum [BD]/E808_BD[short]-03.wav", amp: 2
        end
      end
    end
    on [0,0,0,1,0,0,0,1].ring.look do
      if novation['ringo_2']
        ##| with_swing -0.25, pulse: 2 do
        sample folder + "Snare Drum [SD]/E808_SD-02.wav", amp: 0.4
        ##| end
      end
    end
    if novation['ringo_3']
      on [0,1,0,0,0,1,0,0].ring.look do
        sample folder + "Closed Hi Hat [CH]/E808_CH-01.wav"
      end
      on [1,0,0,0,0,0,0,0].ring.look do
        sample folder + "Open Hi Hat [OH]/E808_OH-03.wav", finish: 0.2, amp: 0.7
      end
    end
    if novation['ringo_4']
      on spread(5,16, rotate: 3).look do
        with_swing -0.25, pulse: 4 do
          sample folder + "Congas [HC-MC-LC]/E808_MC-08.wav", cutoff: 100
        end
      end
    end
    sleep 0.5
  end
end

live_loop :paul, sync: :ringo do
  if novation['paul']
    #mod piano
    ##| time_warp -0.15 do
    midi_chord (chord_degree [1,3,5,2].ring.tick, :b2, :major, 3),
      sustain: 3
    ##| end
    cue :paul
  end
  sleep 4
end

live_loop :john, sync: :ringo do
  s = "/home/jsanjuan/musicradar-808-samples/manson_believe_me.wav"
  if novation['john']
    sample s
    novation['john'] = false
  end
  sleep sample_duration s
end

live_loop :george, sync: :ringo do
  use_random_seed 4
  32.times do
    if novation['george']
      time_warp -0.15 do
        midi (scale :b1, :mixolydian, num_octaves: 2).choose,
          sustain: [0.2, 0.5].choose,
          port: 'ch345_ch345_midi_1_24_0' unless one_in 5
      end
    end
    sleep [0.25,0.5].choose
  end
end

live_loop :control do
  use_real_time
  value, velocity = sync "/midi*1/control_change"
  case value
  when 2
    novation['paul'] = !novation['paul']
  when 3
    novation['john'] = !novation['john']
  when 4
    novation['george'] = !novation['george']
  when 6
    novation['ringo_1'] = !novation['ringo_1']
  when 7
    novation['ringo_2'] = !novation['ringo_2']
  when 8
    novation['ringo_3'] = !novation['ringo_3']
  when 9
    novation['ringo_4'] = !novation['ringo_4']
  when 116
    novation['ringo_5'] = !novation['ringo_5']
  when 117
    novation['ringo_6'] = !novation['ringo_6']
  end
  print 'paul ' + String(novation['paul'])
  print 'john ' + String(novation['john'])
  print 'george ' + String(novation['george'])
  print 'ringo_1 ' + String(novation['ringo_1'])
  print 'ringo_2 ' + String(novation['ringo_2'])
  print 'ringo_3 ' + String(novation['ringo_3'])
  print 'ringo_4 ' + String(novation['ringo_4'])
  print 'ringo_5 ' + String(novation['ringo_5'])
  print 'ringo_6 ' + String(novation['ringo_6'])
  print '####################################'
end



