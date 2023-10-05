with_fx :reverb, room: 1 do
  
  live_loop :lkjl do
    use_bpm 70
    with_fx :bitcrusher, bits: 4 do |b|
      16.times do
        density [1,1,2,4].choose do
          control b, mix: [0,1].choose
          sample "C:/Users/jsanjuan/Desktop/BeatK01 120-07.wav",
            onset: pick
          sleep 0.5
        end
      end
    end
  end
  
  live_loop :asf, sync: :lkjl do
    use_bpm 70
    n1=dice(8)
    with_fx :wobble, res: 0.9, seed: 5 do |w|
      8.times do
        tick
        control w, mix: [0,0].choose
        sample :elec_twip, rate: 3 if spread(n1,8).look
        sample :elec_tick, rpitch: [0,3,6].choose, rate: 1.5 if spread(9,16).look
        on [1,0,0,1,1,1,0,1,1,0,1,1,0,0,1,0].ring.look do
          sample :elec_triangle, rpitch: [6,9,12,15,3].choose unless one_in(4)
        end
        sleep 0.125
      end
    end
  end
  
  live_loop :sdaf, sync: :lkjl do
    use_bpm 70
    with_fx :octaver, super_amp: 2 do
      16.times do
        synth :blade,
          cutoff: rrand(60,130),
          note: (chord :e2, :M, num_octaves: 3).choose,
          release: [0.1,0.2].choose #unless one_in(5)
        sleep 0.125
      end
    end
  end
  
end