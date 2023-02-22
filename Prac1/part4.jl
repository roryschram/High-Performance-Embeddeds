using WAV
using Plots
using PlotlyJS
plotlyjs()
using Statistics

### Utalizing the function with the for loop to generate the data

function createwhiten(n)
    whiteNoise = Array{Float64}(undef, 0)
    for i in 1:n
        for j in 1:48000
            append!(whiteNoise, (rand(1)*2).-1)
        end
    end
    println("Number of samples: ", length(whiteNoise))
    WAV.wavwrite(whiteNoise, "whiteNoise2.wav", Fs=48000) #sample freq is 4800Hz
    return whiteNoise;
end

whiteNoiseForLoop = createwhiten(1)
whiteNoise = (rand(48000)*2).-1


p1 = Plots.histogram(whiteNoiseForLoop)
title!("Random Number Distrobution")
yaxis!("Frequency")
xaxis!("Number Generated")

display(p1)

Statistics.cor(whiteNoise, whiteNoiseForLoop)