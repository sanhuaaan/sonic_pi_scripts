use_bpm 70

live_loop :ringo do
  sleep 4
end

live_loop :chris, sync: :ringo do
  tick
  use_random_seed 50
  16.times do
    with_fx :echo, phase: 0.5, mix: 0, decay: 8 do
      with_fx :reverb do
        with_fx :flanger, feedback: rand, delay: 1, invert_flange: 1, depth: 2, decay: 0.5 do
          with_fx :lpf, cutoff: rrand(50,90) do
            sample "D:/Sonic Pi samples/AC_ArpBass"+["A","B"].choose+"_95-"+["A","C"].choose+".wav",
              num_slices: 16,
              slice: pick,
              beat_stretch: [4,4,8].choose,
              rate: [1,1,1,0.5,1.5].choose * [1,1,1,-0.5].choose unless one_in(5)
          end
        end
      end
    end
    sleep 4.0/16
  end
  ##| stop
end

live_loop :billy, sync: :ringo do
  ##| stop
  tick
  sample :bd_sone if factor?(look,4)
  with_fx :echo, mix: [0,1].choose, phase: 4.0/[16,32].choose do
    with_fx :ixi_techno, phase_offset: rand do
      sample 'D:\Sonic Pi samples\PO-12 Samples\snare_hi', rand_i(20) if spread(6,16,rotate: 3).tick unless one_in(5)
      sample 'D:\Sonic Pi samples\PO-12 Samples\snare_lo', rand_i(20) if spread(7,8).look unless one_in(4)
    end
  end
  sleep 2.0/(stretch 16,8,8,8).look
end

live_loop :john_r, sync: :ringo do
  ##| stop
  ##| with_fx :krush, cutoff: rrand(80,120), mix: rand do
  sample 'D:\Sonic Pi samples\Loop 02 (130BPM).wav', onset: pick
  ##| end
  sleep [0.25,0.125].choose
end

live_loop :john_l, sync: :ringo do
  stop
  n=(octs :c2, 4).mirror
  tick
  with_fx :bitcrusher, bits: rrand(1,6), cutoff: (line 80,120,steps: 80).mirror.look do
    [1,1,1,2,3].choose.times do
      synth :blade, note: n.look, release: [0.2,0.4].choose, pan: [-1,1].ring.look unless one_in(4)
      sleep 0.125
    end
  end
end
