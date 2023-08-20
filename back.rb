use_bpm 50
################################################
define :midi_chord do |notes, *args|
  [2,2,3].choose.times do |i|
    midi notes[i], *args
    ##| port: 'ch345_ch345_midi_1_20_0'
    ##| sleep rand * 2
  end
end

defonce :midi_channels do
  (1...(1+16)).to_a
end
defonce :channel_index do
  set :ch_index, 0
end
define :get_channel do
  i = get[:ch_index]
  midi_channels.ring[i]
  set :ch_index, i + 1
end
################################################

live_loop :ringo do
  ##| stop
  4.times do |i|
    #volca bass
    midi_clock_beat port: 'ch345_ch345_midi_1_20_0'
    #nts-1
    midi_clock_beat port: 'nts-1_digital_kit_nts-1_digital_kit_nts-1_digital_24_0'
    #sq-1
    midi_clock_beat port: 'sq-1_sq-1_sq-1___ctrl_28_1' #if factor?(i, 2)
    sleep 0.6
  end
end

live_loop :paul, sync: :ringo do
  time_warp -0.01 do
    section = 'a'
    nt_ring = [:d, :f, :a].ring
    ch_ring = [:minor, :major, :minor].ring
    sus = rrand(4,7)
    dens = [1]
    if section == 'b'
      dens = [1,1,1,1,1,2,4,0.5]
      sus = 2
    end
    tick
    set :nt, nt_ring.look
    set :ch, ch_ring.look
    set :sus, sus
    set :dens, dens
  end
  cue :paul
  sleep get[:sus] + 1
end

with_fx :reverb do
  live_loop :john, sync: :paul do
    ##| stop
    tick(:a)
    get[:dens] #¯\_(ツ)_/¯
    density (get[:dens]).choose do
      on [0,1,0,0,1,0,0,0,1,0,0,0].ring.look(:a) do
        sample "/home/jsanjuan/DrumHits/Kick.wav", amp: 0.6
      end
      on [1,0,1,0,0,1,0,1,0,1,1,0].ring.look(:a) do
        sample "/home/jsanjuan/DrumHits/Hat.wav", amp: 0.4
      end
      on [0,0,0,0,0,0,0,1].ring.look(:a) do
        sample "/home/jsanjuan/DrumHits/Snare.wav", amp: 0.5
      end
      on [0,0,0,[1,0,0].ring.tick(:b),0,0,0,0].ring.look(:a) do
        sample "/home/jsanjuan/DrumHits/OpenHat.wav", amp: 0.3
      end
      sleep 0.15
    end
  end
end

live_loop :george, sync: :paul do
  stop
  use_random_seed 555
  16.times do
    use_transpose -12
    midi (chord get[:nt], get[:ch], num_octaves: 3).choose,
      sustain: 0.2,
      port: 'nts-1_digital_kit_nts-1_digital_kit_nts-1_digital_24_0' #unless one_in 3
    sleep 0.15
  end
end

live_loop :billy do
  sync :paul
  midi get[:nt] - [12,24].choose,
    sustain: get[:sus],
    channel: get_channel,
    port: 'midi_through_midi_through_port-0_14_0'
  midi_chord (chord get[:nt], get[:ch], num_octaves: 2),
    sustain: get[:sus],
    channel: get_channel,
    port: 'midi_through_midi_through_port-0_14_0',
    vel_f: 0.5
end

