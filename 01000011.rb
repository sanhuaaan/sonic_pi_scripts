live_loop :mixed_ramdomness do
  tick
  use_random_seed 500
  with_fx :echo do
    sample :elec_ping if spread(3,4).look
  end
  sample :elec_beep, amp: 0.4 if spread(5,8).look
  sample :bass_trance_c if factor?(look,16)
  in_thread do
    use_random_seed Random.new.rand(10000)
    density [1,1,2].choose do
      with_fx :distortion, distort: 0.8 do
        with_fx :krush, mix: rand do
          sample 'D:/Sonic Pi samples/mixed_randomness',
            rand_i(3),
            rate: rrand(0.5,2)*[1,-1].choose unless one_in(4)
          sleep 0.25
        end
      end
    end
  end
  (stretch 3,3,6,1,1,1,3,2,10,1).look.times do
    with_fx ((rand<0.7) ? :bitcrusher : :flanger) do
      synth :chipbass, note: (chord :c3, '+5', num_octaves: 4).choose, release: [0.2].choose
    end
    sleep 0.125
  end
end
