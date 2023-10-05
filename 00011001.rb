n=[:c,:d,:a,:b].ring

live_loop :Roy do
  use_synth :tech_saws
  play (chord n.tick(:chord), :major, num_octaves: 2), release: 3
  sleep 1.8
  8.times do
    use_synth :hoover
    play (chord n.look(:chord), :major, num_octaves: 2).take(4).mirror.tick(:note)
    sleep 0.2
  end
end

live_loop :Pris, sync: :Roy do
  use_random_seed 9
  bassline= chord(n.tick(:chord), :m7).take(6).shuffle
  use_synth :prophet
  use_synth_defaults amp: 2
  2.times do
    play bassline.tick(:b)
    sleep 0.9
  end
  4.times do
    play bassline.tick(:b)
    sleep 0.4
  end
end
