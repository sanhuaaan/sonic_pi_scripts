defonce :dfonc_synth do
  {
    #knobs
    41 => 110, 42 => 0.05, 43 => 0.1, 44 => 60, 21 => 90, 22 => 24, 28 => 40, 48 => 120, 27 => 40, 47 => 120,
    46 => 0.3,
    'random_cutoff_1' => 0,
    'random_cutoff_2' => 0
  }
end

defonce :ini_light do
  midi_note_on 28, 3, port: "launch_control"
  midi_note_on 27, 3, port: "launch_control"
end

define :gaff do |n|
  use_synth_defaults amp: dfonc_synth[46],
    #cutoff: dfonc_synth['random_cutoff_1']==0 ? dfonc_synth[41] : rrand(dfonc_synth[28],dfonc_synth[48]),
    release: dfonc_synth[43],
    cutoff_min: dfonc_synth[44],
    cutoff_attack: dfonc_synth[42]
  
  #ctff2=dfonc_synth[21]
  
  dtn=dfonc_synth[22]
  
  synth :tb303, note: n, wave: 0, cutoff: dfonc_synth['random_cutoff_1']== 0 ? dfonc_synth[41] : rrand(dfonc_synth[28],dfonc_synth[48])
  synth :tb303, note: n+dtn, wave: 1, cutoff: dfonc_synth['random_cutoff_2']== 0 ? dfonc_synth[21] : rrand(dfonc_synth[27],dfonc_synth[47])
end

live_loop :synth_control do
  use_real_time
  n, val = sync "/midi/launch_control/0/15/control_change"
  
  case n
  when 41
    dfonc_synth[n] = val if dfonc_synth['random_cutoff_1'] == 0
  when 21
    dfonc_synth[n] = val if dfonc_synth['random_cutoff_2'] == 0
  when 44, 28, 48, 27, 47
    dfonc_synth[n] = val
  when 42
    dfonc_synth[n] = (val/128.0)
  when 43
    ##| dfonc[n] = [0.1,0.2,0.3,0.4,0.5][((val/128.0)*4).round]
    dfonc_synth[n] = (val/128.0)/2
  when 22
    #dfonc_synth[n] = [1.5,3,6,12,24][((val/128.0)*4).round]
    dfonc_synth[n] = (val/128.0)*48
  when 46
    dfonc_synth[n] = (val/128.0)*3
  end
end

live_loop :random_control do
  use_real_time
  sample_num, velocity = sync "/midi/launch_control/0/15/note_on"
  case sample_num
  when 28
    dfonc_synth['random_cutoff_1'] = dfonc_synth['random_cutoff_1'] == 1 ? 0 : 1
    midi_note_on 28, 3+(121*dfonc_synth['random_cutoff_1']), port: "launch_control"
  when 27
    dfonc_synth['random_cutoff_2'] = dfonc_synth['random_cutoff_2'] == 1 ? 0 : 1
    midi_note_on 27, 3+(121*dfonc_synth['random_cutoff_2']), port: "launch_control"
  end
end





