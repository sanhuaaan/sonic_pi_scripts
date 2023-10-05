n=nil
loop do
  sample 34,amp:rand>0.6?2.0:0.5
  sample [27,n,14,n,n,n,n,n,41,n,n,n,n,n,27,n].ring.tick
  sleep 0.2
end