live_loop :glitch_party_hard do
  use_bpm 70
  tick(:main)
  if spread([3,4,5].ring.look(:main),8).look(:main)
    sample 'D:\Sonic Pi samples\hits', (rand<0.5 ? 0 : 1)
  end
  time_warp 0 do
    use_random_seed Random.new.rand(125)
    density [1,1,2].choose do
      sample 'D:\Sonic Pi samples\glitch', 0, amp: 1.5 if spread(3,8).look(:main)
      sleep 0.25
    end
  end
  if factor?(look(:main),8)
    time_warp 0 do
      use_random_seed (stretch [519,612,888,111],8).tick(:sub)
      with_fx :tanh, krunch: 20 do
        [4,8].ring.look(:sub).times do
          synth :tri, note: (chord :a4,:diminished, num_octaves: 2).choose, release: 0.2, amp: 0.1
          sleep 4.0/32
        end
      end
    end
  end
  sample :bd_tek, amp: 3 if factor?(look(:main),4)
  with_fx :flanger, feedback: rrand(0.2,0.8) do
    with_fx :krush, cutoff: rrand(80,120) do
      sample 'D:/Sonic Pi samples/BassC_110A-02.wav',
        num_slices: 32,
        slice: pick,
        beat_stretch: [3,4].choose,
        rate: rrand(0.5,1.5)
      sleep 4.0/32
    end
  end
end
