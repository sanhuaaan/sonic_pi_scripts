# forked from nicoder
# line 13 '?' asks for conditional and executes either first sample (true) or the one after ':' (false)
# problem with this formulation is that you can't specify sample parameters individually, just across the whole line

bpm = 120

live_loop :r do
  use_bpm bpm
  with_fx :slicer, phase: 0.25, filter: 1, mix: 1 do
    (spread 5, 16, rotate: 3).each do |b|
      sample b ?  :drum_tom_mid_hard : :drum_cymbal_closed, amp: 0.5
      sleep 0.25
    end
  end
end

