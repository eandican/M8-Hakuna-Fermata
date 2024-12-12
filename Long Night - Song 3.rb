# song 3

clap = "/Users/eandican/Library/CloudStorage/OneDrive-BowdoinCollege/Desktop/Samples/tech-house-clap-slap.wav"
open_hat = "/Users/eandican/Library/CloudStorage/OneDrive-BowdoinCollege/Desktop/Samples/909openhat.wav"
closed_hat = "/Users/eandican/Library/CloudStorage/OneDrive-BowdoinCollege/Desktop/Samples/909closedhat.wav"

use_bpm 122

live_loop :met1 do
  current_tick = tick
  set :global_tick, current_tick
  sleep 1
end

################### Song Three ####################

################### Melody Used ###################

# Lead
live_loop :house_lead, sync: :met1 do
  with_fx :reverb, room: 0.5 do
    use_synth :fm
    use_synth_defaults release: 0.2, sustain: 7.8, cutoff: 90, amp: 0.5
    
    first = chord(:a3, :minor7)
    second = chord(:c3, :major7)
    
    play first, sustain: 4, release: 4, attack: 0.1
    sleep 8
    play second, sustain: 4, release: 4, attack: 0.1
    sleep 8
  end
end

################### Melody Used ###################

###################### Drums ######################

# Kick
live_loop :kickdrum, sync: :met1 do
  current_tick = get(:global_tick)
  if current_tick >= 64
    sample :bd_tek, release: 0.1
  end
  sleep 1
end

# Clap
live_loop :clap, sync: :met1 do
  current_tick = get(:global_tick)
  sleep 1
  if current_tick >= 80
    sample clap
  end
  sleep 1
end

# Open Hi-Hat
live_loop :openhat, sync: :met1 do
  current_tick = get(:global_tick)
  with_fx :reverb, room: 0.75 do
    sleep 0.5
    if current_tick >= 96
      sample open_hat, amp: 1.25
    end
    sleep 1.5
  end
end

# Closed Hi-Hat
live_loop :hat, sync: :met1 do
  current_tick = get(:global_tick)
  with_fx :reverb, room: 0.5 do
    sleep 0.25
    if current_tick >= 112
      sample closed_hat, amp: 0.25
      sleep 0.5
      sample closed_hat, amp: 0.25
      sleep 1.25
    end
  end
end


# Bassline
live_loop :bass, sync: :met1 do
  current_tick = get(:global_tick)
  if current_tick >= 128
    use_synth :sine
    4.times do
      play :a2, release: 0.8, amp: 0.75
      sleep 2
    end
    play :c2, release: 0.8, amp: 0.75
    sleep 2
    play :c2, release: 0.8, amp: 0.75
    sleep 1
    play :c2, release: 0.8, amp: 0.75
    sleep 1
    play :c2, release: 0.8, amp: 0.75
    sleep 2
    play :c2, release: 0.8, amp: 0.75
    sleep 2
  else
    sleep 1
  end
end

###################### Drums ######################

################### Song Three ####################

