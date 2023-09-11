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
      time_warp -0.2 do
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
      on spread(5,12).look do
        ##| with_swing -0.25, pulse: 4 do
        sample folder + "Congas [HC-MC-LC]/E808_MC-08.wav", cutoff: 100
        ##| end
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

live_loop :john do
  use_real_time
  value, velocity = sync "/midi*1/control_change"
  if (value == 3)
    s = "/home/jsanjuan/musicradar-808-samples/war_games/" + ["1","2","3","4","5","6"].ring.tick + ".wav"
    sample s
    novation['john'] = false
  end
end

live_loop :george, sync: :ringo do
  use_random_seed 3333
  [10,16].ring.tick.times do
    if novation['george']
      time_warp -0.15 do
        midi (scale :b2, :mixolydian, num_octaves: 2).choose,
          sustain: [0.2, 0.5].choose,
          port: 'ch345_ch345_midi_1_24_0' unless one_in 4
      end
    end
    sleep 0.25
  end
end

live_loop :control do
  use_real_time
  value, velocity = sync "/midi*1/control_change"
  case value
  when 2
    key='paul'
  when 3
    key='john'
  when 4
    key='george'
  when 6
    key='ringo_1'
  when 7
    key='ringo_2'
  when 8
    key='ringo_3'
  when 9
    key='ringo_4'
  when 116
    key='ringo_5'
  when 117
    key='ringo_6'
  end
  novation[key] = !novation[key]
  for key in ['paul','john','george','ringo_1','ringo_2','ringo_3','ringo_4','ringo_5','ringo_6'] do
    print key + ' ' + String(novation[key])
  end
end



