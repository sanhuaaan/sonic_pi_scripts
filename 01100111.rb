live_loop :vcv do
  ##| density [1,1,2].choose do
  time_warp -0.02 do
    midi_clock_tick
  end
  sleep 0.5
  ##| end
end

with_fx :reverb do
  live_loop :glowing_juniper, sync: :vcv do
    with_fx :lpf, cutoff: 90 do
      with_fx :echo, decay: [4,8].choose, phase: [0.25,0.25,0.5].choose do
        ##| density [1,1,1,1,2,3,4,8].choose do
        synth :sine, note: (chord :d4, :major, num_octaves: 2).choose, release: 0.1 unless one_in(4)
        synth :tri, note: (chord :d6, :halfdiminished, num_octaves: 1).choose, release: [0.1,0.5].choose unless one_in(3)
        sleep 0.5
        ##| end
      end
    end
  end
  
  live_loop :rider, sync: :vcv do
    sample :ambi_glass_rub, beat_stretch: 4, rpitch: [0,0,3,3].ring.tick
    sleep 4
  end
end

