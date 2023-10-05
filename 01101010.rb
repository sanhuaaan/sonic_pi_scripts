with_fx :reverb, room: 1 do
  live_loop :lkj do
    with_fx :tremolo, depth: 0.7 do |t|
      ##| control t, depth: rand
      8.times do
        sample "C:/Users/jsanjuan/Desktop/MonkPad-02.wav", rpitch: get[:r],
          num_slices: 6, slice: dice(5) - 1, beat_stretch: 4
        sleep [0.5, 0.25].choose
      end
    end
  end
  
  live_loop :lkjj do
    set :r, [0,3].ring.tick
    sleep 4
  end
  
  live_loop :hghgf do
    use_random_seed 22
    with_fx :lpf, cutoff: 70 do
      4.times do
        use_transpose get[:r]
        synth :sine, note: (chord :d4, :halfdim).choose, release: 0.1
        sleep 0.25
      end
    end
  end
  
  live_loop :kjll do
    with_fx :ixi_techno, phase_offset: rand, phase: [4,8].choose do
      16.times do
        tick
        on [1,0,0,1,1,1,0,0,1,0,0,0,1,1,0,1].ring.look do
          sample :elec_chime, rate: 4
        end
        sample :elec_flip, rate: [2,3,4,5].choose if spread(5,8).look
        sample :elec_pop, rate: [2,3,4,5,6].choose, lpf: 80 unless one_in(4)
        sleep 0.125
      end
    end
  end
  
  
  
end


