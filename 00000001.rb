i=60
live_loop :random_riff do
  use_synth :dsaw
  use_random_seed 15
  notes = (scale :e3, :minor_pentatonic).shuffle
  #play notes.tick, release: 0.25, cutoff: i
  j=0
  3.times do
    play notes[j], release: 0.25, cutoff: i, amp: 0.3
    sleep 0.25
    j+=1
  end
  i+=1 if (i<=108)
  print i
end

live_loop :beats do
  if i>=84
    sample :bd_tek
    with_fx :echo, phase: 0.125, mix: 0.4 do
      sample :drum_cymbal_soft, sustain: 0, release: 0.1, amp: 0.3
    end
    sleep 0.50
    sample :drum_cymbal_pedal, amp: 0.3
  end
  sleep 0.25
end


live_loop :trumpetFromHell do
  if i>=108
    with_fx :reverb do
      synth :prophet,attack: 4, release: 8, note: choose(chord(:E1, :minor)), cutoff: 80, amp: 2
    end
  end
  sleep 12
end
