live_loop :billy do
  with_fx :echo, phase: 3.0/[16,32].choose, decay: (stretch 0.75,3,3,1).choose, mix: [0,1].choose do
    sample [:elec_blip2,:elec_blip].choose, rpitch: [0,1.5,3,6].ring.look if spread(9,16, rotate: 3).tick
  end
  cue :sequence if look == 60
  density [1,1,1,0.5,2].choose do
    if look > 25
      with_fx :reverb do
        with_fx :bitcrusher, bits: rrand_i(4,8), pre_amp: 2, cutoff: rrand(70,120) do
          sample 'D:\Sonic Pi samples' +
            ["/Beat35_132BPM(Just_Drums).wav",
             "/DD_Beat_Octofuzz_170-03.wav",
             "/Disco (120BPM).wav",
             "/07(130BPM).wav"].choose,
            num_slices: 16,
            beat_stretch: [3,3,3,9,12,24].choose,
            slice: pick,
            rate: [-1,1,1,1].choose
        end
      end
    end
    sleep 3.0/16
  end
end

live_loop :chris, sync: :sequence do
  cue :chords_l if tick == 2
  use_random_seed 600
  with_fx :panslicer, phase: 3.0/8 do
    16.times do
      sample "D:\Sonic Pi samples/Loop 02 (130BPM).wav", onset: pick
      sleep 3.0/16
    end
  end
end

ch=[:Fs,:D,:A,:E].ring
live_loop :john_l, sync: :chords_l do
  cue :chords_r if look == 7
  play (chord ch.tick, :major), release: 3
  sleep 3
end

live_loop :john_r, sync: :chords_r do
  n=ch.tick(:main)
  16.times do
    synth :tri, note:(octs n, 4).tick(:oct) - 12, release: 0.1
    sleep 3.0/16
  end
end
