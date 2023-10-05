loop do
  r=choose([2.0,4.0,8.0])
  s=choose((0..r-1))/r
sample:loop_amen,start:s,finish:s+1/r
  sleep 1.75/r
end

#Take a look at the onset: and slice: opts in the sample fn ;-)