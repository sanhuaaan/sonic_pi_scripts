scala = scale :C, :aeolian

syntes = [:beep, :blade, :bnoise, :cnoise, :dark_ambience, :dpulse,
          :dsaw, :dull_bell, :fm, :gnoise, :growl, :hollow, :hoover, :mod_beep,
          :mod_dsaw, :mod_fm, :mod_pulse, :mod_saw, :mod_sine, :mod_tri,
          :noise, :piano, :pnoise, :pretty_bell, :prophet, :pulse,
          :saw, :sine, :square, :subpulse, :supersaw, :tb303, :tri, :zawa]

syntes.each do |synte|
  
  synth synte, note: scala.tick
  sleep 0.25
  
  synth synte, note: scala.tick
  sleep 0.25
  
  synth synte, note: scala.tick
  sleep 0.5
  
  synth synte, note: scala.tick
  sleep 0.5
  
  synth synte, note: scala.tick
  sleep 1.5
  
end