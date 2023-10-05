use_synth :tri

define :plAmbiChoir do |n,nt,sr|
  #use :rpitch to calculate pitch for required note frequency
  #Natural note is 75.2 found by experiment comparing
  #play 75.2   and     sample :ambi_choir      sounds
  sample :ambi_drone,rpitch: note(n)-75.2,sustain: nt*sr,release: nt*(1-sr),amp: 2
end


live_loop :test do
  #test live loops plays notes from scale accompanied by pitched sample :ambi_choir
  #nTime adjusts time between notes
  #srRatio adjusts % sustain and release times: eg 1 gives all sustain 0 release
  #0.5 gives equal sustain and release times
  #note you are restricted by duration of sample :ambi_choir (about 1.57s)
  #this duration will reduce when pitch is raised
  nTime=0.5;srRatio=0.95
  n=note(scale(:c4,:major,num_octaves: 2).choose)
  play n,sustain: nTime*srRatio,release: nTime*(1-srRatio),amp: 0.5
  plAmbiChoir(n,nTime,srRatio)
  sleep nTime
end