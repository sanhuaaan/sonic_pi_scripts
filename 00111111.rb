live_loop :babel do
  tick
  with_fx :bitcrusher, bits: 8 do
    with_fx :wobble, mix: 0.9 do
      sample 'D:/Sonic Pi samples/loops/DD_Beat_DOA_125-04.wav',
        num_slices: 16,
        slice: pick,
        beat_stretch: 3
    end
  end
  with_fx :flanger do
    sample :elec_twang, rate: rrand(0.7,1.4), amp: 2 unless one_in(3)
  end
  synth :chipbass, release: 0.1, amp: 0.8 unless one_in(4)
  time_warp [-0.25,0,0.25].choose do
    density [1,2].choose do
      with_fx :reverb, room: 1 do
        with_fx :distortion, distort: 0.8 do
          synth [:blade, :beep, :saw, :tech_saws].choose,
            note: (chord [:b2,:b3].choose,'+5', num_octaves: 2).choose,
            amp: [0.1,0.2,0.3].choose,
            release: 0.1,
            pan: -1 if spread(6,8).look
          synth [:chiplead, :cnoise, :tri, :square].choose,
            note: (chord [:b2,:b3].choose,:major, num_octaves: 2).choose,
            amp: [0.1,0.2,0.3].choose,
            release: 0.1,
            pan: 1 if spread(5,8).look
        end
      end
    end
  end
  sleep 3.0/16
end
