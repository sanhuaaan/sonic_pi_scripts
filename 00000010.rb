i=0
seed=[7, 8].ring
seedIndex = 0
riffNotes=8
live_loop :random_riff do
  use_synth :dsaw
  use_random_seed seed[seedIndex]
  escalas = [:c3,:e3,:g3,:c4].ring
  notes = (scale escalas[i], :minor_pentatonic).shuffle
  j=0
  3.times do
    play notes[j], release: 0.25
    sleep 0.25
    j+=1
  end
  riffNotes-=1
  if (riffNotes==0)
    i+=1
    riffNotes=8
    seedIndex+=1
  end
  print i
end