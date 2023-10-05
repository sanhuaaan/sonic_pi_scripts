


live_loop :glowing_juniper do
  use_bpm 65
  with_fx :bitcrusher do
    with_fx :flanger do |f|
      12.times do
        on [0,1,0,0,1,0,1,0,1,1,0,1].ring.tick do
          density [1,4,2].choose do
            control f, feedback: rand
            sample [:elec_ping, :elec_flip, :elec_blup].choose, rpitch:[3,6,9].choose, rate: [-1,1].choose
            sleep 0.125
          end
        end
        sleep 0.125
      end
    end
  end
end

live_loop :dsfa, sync: :glowing_juniper do
  use_bpm 65
  ##| with_fx :ixi_techno, phase: rand, phase_offset: rand do
  with_fx :bitcrusher do
    in_thread do
      n=rrand_i(10,30)
      n.times do |i|
        sample :elec_beep, rate: 4
        sleep (line, 0.02,[0.125,0.25,0.5].choose,steps: n)[i]
      end
    end
  end
  16.times do
    tick
    sample :elec_beep, rate: 2 if spread(9,16).look
    sample :elec_snare, rate: 2 if spread(11,16).look
    sleep 0.125
  end
  ##| end
end

live_loop :picoloop, sync: :glowing_juniper do
  use_bpm 65
  ##| density [1,1,1,2,4,0.5].choose do
  time_warp -0.1 do
    ##| midi_clock_beat
  end
  sleep 0.5
  ##| end
end

live_loop :assdfa, sync: :glowing_juniper do
  with_fx :krush, res: 0, res_slide: 0.5, mix: 0, mix_slide: 2 do |k|
    sample :ambi_dark_woosh, pitch_slide: 4, beat_stretch: 4
    control pitch: 0.1
    control k, mix: 1, res: 0.9
  end
  sleep 4
end
