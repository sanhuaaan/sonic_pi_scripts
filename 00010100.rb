live_loop :dfhgsd do
  with_fx :slicer, phase: 0.125 do
    use_transpose rrand(0,5)
    use_synth :tb303
    ch = play (chord :f3, :add9), cutoff: 50, cutoff_slide: 4, amp: 1, attack: 1, release: 8
    control ch, cutoff: 130
    sleep 6
  end
end


