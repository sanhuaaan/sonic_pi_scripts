live_loop :adf do
  use_random_seed 2000
  with_fx :bitcrusher, bits: 8 do
    synth :dsaw, note: :e3, sustain: 8, note_slide: 0.04, release: 0
    64.times do
      sleep 0.125
      control note: (scale :e1, :minor_pentatonic, num_octaves: 3).choose
    end
  end
end
