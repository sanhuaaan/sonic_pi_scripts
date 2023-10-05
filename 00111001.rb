s=''
live_loop :poiu do
  s=play (chord :c, '13'), sustain: 8
  sleep 10
end

live_loop :asdf do
  gaff s if spread(3,16).tick
  gaff s if spread([0,0,7,9,13].choose,16).look
  sleep 0.125
end

define :gaff do |p|
  in_thread do
    sleep [0.125,0.25].choose
    control p, note: 0
    sleep 0.125
    control p, note: (chord :c, '13')
  end
end

live_loop :adf do
  sample :drum_cymbal_closed if spread([3,4,5].choose,12).tick
  sample :drum_tom_lo_soft if spread([4,8].choose,16).look
  sample :drum_tom_mid_soft if spread(8,14).look
  sleep 0.125
end
