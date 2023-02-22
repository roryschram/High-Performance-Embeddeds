using WAV
using TickTock
using Plots
using PlotlyJS
plotlyjs()

numberOfSeconds = 1000

function createNoise(seconds)
    whiteNoise = (rand(seconds*48000)*2).-1
end

tick()
whiteNoise = createNoise(1)
tock()

WAV.wavwrite(whiteNoise, "whiteNoise1.wav", Fs=48000) #sample freq is 4800Hz

p1 = Plots.histogram(whiteNoise)
title!("Random Number Distrobution")
yaxis!("Frequency")
xaxis!("Number Generated")

display(p1)