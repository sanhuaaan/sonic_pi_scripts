use_synth:tb303
o=false
loop do
  play [28,30,40].ring.tick(:a),release:0.15
  sample [24,34,62,34].ring.tick if o=!o
  sleep 0.125
end