live_loop :Roy do
  sample :ambi_drone, beat_stretch: 5
  sleep 4
end

live_loop :Pris, sync: :Roy do
  14.times do
    sample "D:/Sonic Pi samples/hits", 0 if spread(9,14).tick
    sample :elec_blip if spread(3,7).look
    synth :noise, note: 60, release: 0.1, amp: 0.5 if spread(8,14).look
    sleep 0.25
  end
  cue :leon
end

live_loop :Leon, sync: :Roy do
  18.times do
    synth :beep, note: 80
    sleep 0.125
  end
  sync :leon
end

live_loop :Zhora, sync: :Roy do
  #stop
  with_fx :bitcrusher, bits: 3 do
    with_fx :slicer, wave: 3, amp_min: 0.4, phase: rrand(0.125,0.25), phase_slide: 0.5 do |s|
      synth :fm, depth: rrand(0,2), divisor: rrand(0,2), depth_slide: 0.5, divisor_slide: 0.5, sustain: 7, amp: 0.5, note_slide: 3
      8.times do
        control depth: rrand(0,5), divisor: rrand(0,5), note: (scale, :c, :minor).choose
        control s, phase: rrand(0.1,0.3)
        sleep 1.5
      end
    end
    control note: 0
  end
  sleep 8
end
