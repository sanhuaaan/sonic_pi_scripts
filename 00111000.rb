use_bpm 120

live_loop :bar do
  sleep 4
end

live_loop :ptn, sync: :bar do
  sleep 4 * 4
end

live_loop :bass1, sync: :bar do
  use_synth :tri
  use_synth_defaults release: 0.25, cutoff: 80, amp: 150
  bass_line1 = (ring :c2, :bb2, :c3, :bb2)
  16.times do
    if spread(3,16).tick
      puts bass_line1.look
      play bass_line1.look
    end
    sleep 0.25
  end
end

live_loop :bass2, sync: :bar do
  use_synth :tri
  use_synth_defaults release: 0.25, cutoff: 80, amp: 150
  bass_line2 = (ring :c2, :f1, :bb1, :c3, :eb3, :g2, :c3, :eb3)
  16.times do
    if spread([0,0,7,9,13].choose,16).tick
      puts bass_line2.look
      play bass_line2.look
    end
    sleep 0.25
  end
end

live_loop :snare, sync: :bar do
  8.times do
    sleep 1
    if one_in 5
      with_fx :echo, phase: [0.75].choose, decay: 1, mix: 0.5 do
        sample :elec_snare, finish: 0.15, hpf: 85, amp: 0.25
      end
    else
      sample :elec_snare, finish: 0.15, hpf: 85, amp: 0.25
    end
    sleep 1
  end
  
end

live_loop :sfsa, sync: :bar do
  use_synth :beep
  with_fx :panslicer, phase: 0.5 do
    with_fx(spread(7,11).map{|s| s ? :slicer : :echo}.tick) do |fx|
      control fx, phase: 0.5
      play (chord :c, :diminished7).choose, amp: 0.6, attack: 0.5
      sleep 1
    end
  end
end

live_loop :chords, sync: :ptn do
  sync :ptn
  use_synth :fm
  use_synth_defaults divisor: 2, depth: 0.5, release: 0.5, release: 2, cutoff: 130, amp: 0.25
  
  with_fx :reverb, room: 1, mix: 0.75 do
    128.times do
      if spread(5,128).tick
        #play chord([:c5,:f5,:eb5,:d5,:a5,:bb5,:c6].choose, '7sus4')
        play chord((scale :c5, :minor_pentatonic, num_octaves: 1).choose, '7sus4')
      end
      sleep 0.25
    end
  end
end