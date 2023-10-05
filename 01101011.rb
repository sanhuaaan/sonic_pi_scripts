with_fx :reverb, room: 1 do
  
  live_loop :lkjl do
    use_bpm 80
    tick_reset
    lpf_=rrand(85,120)
    with_fx :krush, res: rand, mix: rand do
      density [1,1,1,2].choose do
        (dice(8)*2).times do
          sample "C:/Users/jsanjuan/Desktop/ID_BassF125G-01.wav",
            lpf: lpf_,
            beat_stretch: [4,8].choose,
            rpitch: [0].choose,
            onset: [0,1,2,8,8,4,5,5,7,4,2,3,5,4,6,6].ring.tick
          sleep 0.25
        end
      end
    end
  end
  
  live_loop :asdf, sync: :lkjl do
    use_bpm 80
    with_fx :echo, phase: [0.25,0.5,1].choose do
      with_fx :wobble, mix: [0,1].choose, phase: [0.25,0.5].choose do
        sample "C:/Users/jsanjuan/Desktop/SynMos A03.wav", lpf: 80,
          beat_stretch: rrand_i(6,10), rate: [-1,1].choose
        sleep dice(4)
      end
    end
  end
  
  live_loop :asdfas, sync: :lkjl do
    use_bpm 80
    t1=dice(8)
    t2=[3,5,7].choose
    t3=rand_i(7)
    with_fx :bitcrusher, bits: [2,4,6,6,6].choose do |b|
      8.times do
        control b, mix: [0,1].choose
        sample :elec_cymbal, rate: 4, lpf: rrand(110,130) if spread(t1,8).tick
        sample :elec_beep, rate: 3, rpitch: [0,0,3,6,9].choose,
          hpf: 110 if spread(t2,8).look
        sample :elec_fuzz_tom, rpitch: [0,3,6,9,12].choose,
          rate: 4 if spread(t3,8).look
        sleep 0.125
      end
    end
  end
  
  
  live_loop :picoloop, sync: :lkjl do
    use_bpm 80
    4.times do
      time_warp 0.1 do
        midi_clock_beat
      end
      sleep 0.5
    end
  end
  with_fx :level, amp: 12 do
    ##| live_audio :pico
  end
  
end