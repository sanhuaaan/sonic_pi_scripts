with_fx :reverb, room: 1 do
  
  bpm=70
  
  live_loop :ringo do
    use_bpm bpm
    sleep 4
  end
  
  ##| live_loop :picoloop, sync: :ringo do
  ##|   use_bpm bpm
  ##|   4.times do
  ##|     time_warp -0.09 do
  ##|       midi_clock_beat
  ##|     end
  ##|     sleep 0.5
  ##|   end
  ##| end
  ##| with_fx :level, amp: 15 do
  ##|   live_audio :pico
  ##| end
  
  
  live_loop :wewewe, sync: :ringo do
    use_bpm bpm
    ##| stop
    ##| use_random_seed 99
    with_fx :tanh, krunch: dice(4) do
      tick(:b)
      12.times do
        on [0,1,1,0,1,0,0,1,1,1,0,1].ring.tick(:a) do
          synth :sine, note: (chord [:g3,:d3].ring.look(:b), :minor).choose,
            release: 0.2
        end
        synth :saw, amp: 0.2,
          note: (chord [:g4,:d4].ring.look(:b), :minor, num_octaves: 2).choose,
          release: [0.1,0.5].choose unless one_in(3)
        sleep 0.125
      end
    end
  end
  
  live_loop :asdf, sync: :ringo do
    ##| stop
    use_bpm bpm
    rp=[0,3,6,9,12].choose
    with_fx :wobble, mix: [0,1].choose, phase: rand, probability: 0.7 do
      12.times do
        sample "C:/Users/jsanjuan/Desktop/Eko(80).wav", onset: pick,
          rpitch: rp
        sleep 0.125
      end
    end
  end
  
  live_loop :bdbdb, sync: :ringo do
    ##| stop
    use_bpm bpm
    with_swing -0.25 do
      sample :bd_zum
    end
    sleep 0.75
  end
  
end