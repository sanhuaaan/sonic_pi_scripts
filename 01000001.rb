live_loop :analogueish do
  f="D:/Sonic Pi samples/Moog_Misc"
  use_random_seed Random.new.rand(5000)
  tick
  with_fx :reverb, room: 1 do
    time_warp 0 do
      density [1,2].choose do
        sample f, 6, rate: rrand(0.8,1.2)*[1,-1].choose if spread(5,8).look
        sample f, 30, rate: rrand(0.5,2) if spread(4,12).look
        sample f, 11, rate: [1,0.5,1.5].choose*[-1,1].choose if spread(4,8).look
        sleep 0.25
      end
    end
    if factor?(look, 4)
      sleep [0,0.5,1,2].choose
      with_fx :pan, pan: rrand(-1,1), pan_slide: rrand(0.5,3) do |pan|
        with_fx :echo, decay: rrand(1,7), phase: rrand(0.25,1) do
          with_fx :flanger, feedback_slide: 1, feedback: rrand(0.1, 1) do |fx|
            sample :ambi_swoosh, pitch_stretch: 1
            control fx, feedback: rrand(0.1, 1.2)
          end
          if rand < 0.5
            density [1,2,3,4,5].choose do
              sample f, rand_i(37), amp: 0.5, rate: rrand(-1,1)
              control pan, pan: rrand(-1,1)
              sleep [0.25,0.5,1].choose
            end
          end
        end
      end
    end
  end
  sleep 0.25
end