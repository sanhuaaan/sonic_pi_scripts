live_loop :robot_terror_from_space do
  tick(:main)
  if factor?(look(:main),8)
    in_thread do
      density [1,2].choose do
        with_fx :bitcrusher do |fx|
          8.times do
            control fx, mix: rand
            density [0.5,1,1].choose do
              tick(:thrd)
              sample :elec_beep if spread(5,8).look(:thrd)
              sleep 3.0/16
            end
          end
        end
      end
      density [1,2,4].choose do
        8.times do
          tick(:thrd)
          sample :elec_blip2 if spread(3,8).look(:thrd)
          sleep 3.0/16
        end
      end
    end
  end
  time_warp [-3.0/8,0,3.0/8].choose do
    with_fx :echo, decay: 2, phase: 3.0/[8,16,32].ring.look(:main) do
      density [1,1,1,2,2,3].choose do
        synth :fm, note: (chord :c3, '13', num_octaves: 2).choose,
          release: 0.2, divisor: rrand(0.5,2), depth: rrand_i(1,5), amp: 0.6, pan: [-1,1].choose
        sleep 3.0/8
      end
    end
  end
  density [1,1,2].choose do
    sample 'D:/Sonic Pi samples/DD_Beat_Octofuzz_170-03.wav',
      num_slices: 8, slice: pick, beat_stretch: 3, amp: 1.7
    sleep 3.0/8
  end
end

