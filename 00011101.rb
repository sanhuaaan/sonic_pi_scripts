s=scale(:a3,:minor)
use_synth_defaults release:3
loop do
  t=rrand_i(0,11)
  play s[t]
  play s[t+2]
  play s[t+4]
  sleep 3
end