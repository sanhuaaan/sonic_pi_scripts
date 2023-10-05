with_fx :reverb, room: 1 do
  
  bpm=60
  
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
  
  
  live_loop :qwer, sync: :ringo do
    use_bpm bpm
    use_synth :fm
    use_synth_defaults depth: rand(15), divisor: rand(3)
    with_fx :krush, mix: [0,1].choose, res: rand do
      6.times do
        density [1,1,2].choose do
          play_chord (chord :d3, [:add11,'7-5','11','+5'].choose), release: 0.2
          sleep 0.25
        end
      end
    end
  end
  
  live_loop :urur, sync: :ringo do
    use_bpm bpm
    with_fx :wobble, mix: [0,1].choose, phase: rand do
      12.times do
        tick
        sample "C:/Users/jsanjuan/Desktop/Nicceee(120).wav", onset: pick, rate: 2
        sample :elec_blip, rate: 4 if spread(5,12).look
        sample :elec_chime, rate: 6, lpf: 100 if factor? look, 6
        sample :loop_perc2, onset: pick, rate: 2 unless one_in(3)
        sleep 0.125
      end
    end
  end
  
  live_loop :wewewe, sync: :ringo do
    use_bpm bpm
    sample :ambi_glass_hum, beat_stretch: 4, rpitch: [0,6].ring.tick
    sleep 4
  end
  
  
end