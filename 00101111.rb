live_loop :lkj do
  use_random_seed Random.new.rand(2000)
  play [60,70].choose
  sleep 0.5
end
