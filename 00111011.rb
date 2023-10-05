live_loop :nosy_forest do
  density [2,4,6,8].choose do
    synth :pretty_bell, note: (chord :c, :diminished7).choose
    sleep 1
  end
  sample :ambi_glass_rub, pitch_stretch: 1
  time_warp [0.5].choose * [1,-1].choose do
    with_fx :echo do
      sample :elec_plip
    end
    sleep 0.5
    with_fx :reverb, room: 1 do
      synth :hollow, note: :c, amp: 2
    end
  end
  with_fx :slicer, amp_min: 0.4 do
    synth :blade, note: (chord :c3, '+5'), attack: 0.5
  end
  sample :ambi_soft_buzz, rate: -1
  tck = tick
  in_thread do
    ch=[:c, :a, :f, :g].ring
    n=(chord ch[tck], :madd13)
    use_synth :dtri
    play_chord n, release: 1, attack: 1, amp: 0.5
    sleep 0.25
  end
  sleep 1
end