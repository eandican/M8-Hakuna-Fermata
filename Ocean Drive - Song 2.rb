# song 2

sample_chord = "/Users/eandican/Library/CloudStorage/OneDrive-BowdoinCollege/Desktop/Samples/chords130.wav"
clap = "/Users/eandican/Library/CloudStorage/OneDrive-BowdoinCollege/Desktop/Samples/tech-house-clap-slap.wav"
open_hat = "/Users/eandican/Library/CloudStorage/OneDrive-BowdoinCollege/Desktop/Samples/909openhat.wav"
closed_hat = "/Users/eandican/Library/CloudStorage/OneDrive-BowdoinCollege/Desktop/Samples/909closedhat.wav"

use_bpm 130

# Metronome
live_loop :met1 do
  current_tick = tick
  set :global_tick, current_tick
  sleep 1
end

################### Melody Used ###################

# Sample attempt (chooses slice randomly!)
live_loop :main_splice, sync: :met1 do
  with_fx :vowel do
    slices = 8
    duration = (sample_duration sample_chord) / slices
    sample sample_chord, num_slices: slices, slice: rand_i(slices)
    sleep duration
  end
end

# From Sam
with_fx :reverb, mix: 0.25 do
  live_loop :oceans, sync: :met1 do
    s = synth [:bnoise, :cnoise, :gnoise].choose,
      amp: rrand(0.01, 0.05),
      attack: rrand(0, 4),
      sustain: rrand(0, 2),
      release: rrand(1, 5),
      cutoff_slide: rrand(0, 5),
      cutoff: rrand(80, 100),
      pan: rrand(-1, 1),
      pan_slide: rrand(1, 5),
      amp: rrand(0.01, 0.05)
    control s, pan: rrand(-1, 1), cutoff: rrand(60, 110)
    sleep rrand(2, 4)
  end
end

###################### Drums ######################

# Kick
live_loop :kickdrum, sync: :met1 do
  current_tick = get(:global_tick)
  if current_tick >= 64
    sample :bd_tek, release: 0.1
  end
  sleep 2
end

# Clap
live_loop :clap, sync: :met1 do
  current_tick = get(:global_tick)
  sleep 1
  if current_tick >= 64
    sample clap
  end
  sleep 1
end

# Open Hi-Hat
live_loop :openhat, sync: :met1 do
  current_tick = get(:global_tick)
  with_fx :reverb, room: 0.75 do
    sleep 0.5
    if current_tick >= 128
      sample open_hat, amp: 1.25
    end
    sleep 1.5
  end
end

# Closed Hi-Hat
live_loop :closedhat, sync: :met1 do
  current_tick = get(:global_tick)
  with_fx :reverb, room: 0.75 do
    sleep 0.25
    if current_tick >= 128
      sample closed_hat, amp: 0.25, attack: 0.02
    end
    sleep 1.75
  end
end

# Perc that just fits
live_loop :perc, sync: :met1 do
  current_tick = get(:global_tick)
  with_fx :reverb, room: 0.75 do
    if current_tick >= 128
      sample :perc_bell, amp: 0.15, attack: 0.02
    end
    sleep 8
  end
end

# Snare
live_loop :snare, sync: :met1 do
  current_tick = get(:global_tick)
  with_fx :reverb, room: 0.75 do
    sleep 0.75
    if current_tick >= 128
      sample :sn_generic, amp: 0.1, attack: 0.05
    end
    sleep 3.25
  end
end


###################### Drums ######################

#################### Song Two #####################

