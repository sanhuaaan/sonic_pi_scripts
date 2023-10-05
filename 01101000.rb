with_fx :reverb do
  live_loop :tobogán_de_piojos do
    with_fx :distortion, distort: 0.8 do |d|
      10.times do
        control d, distort: [0.8,0.8,0.9].choose
        sample "C:/Users/jsanjuan/Desktop/DD_TempoDroneE_120-E.wav", onset: pick
        sleep 0.125
      end
    end
  end
  
  live_loop :picoloop do
    density [1,2,0.25,0.5].choose do
      time_warp -0.1 do
        midi_clock_beat
      end
      sleep 0.5
    end
  end
  with_fx :ixi_techno, phase: 15, res: 0.9 do
    with_fx :level, amp: 15 do
      live_audio :pico
    end
  end
  
  live_loop :cementerio_de_canelones, sync: :picoloop do
    with_fx :krush do |f|
      10.times do
        control f, res: rand, cuttoff: rrand(80,120), mix: 0
        sample "C:/Users/jsanjuan/Desktop/Beat04_130BPM(Drums_Bass).wav",
          ##| rate: [1,-1].choose,
          slice: pick, num_slices: 8, beat_stretch: 4
        ##| rpitch: [0,3,6,9,12].choose * [-1,1].choose
        sleep [0.125].choose
      end
    end
  end
end
