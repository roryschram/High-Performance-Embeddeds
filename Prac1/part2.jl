using WAV
using Plots
using PlotlyJS
plotlyjs()


### Utalizing the function with the for loop to generate the data
numberOfSeconds = 1
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

tick()
whiteNoise = createwhiten(numberOfSeconds)
tock()

p1 = Plots.histogram(whiteNoise)
title!("Random Number Distrobution")
yaxis!("Frequency")
xaxis!("Number Generated")

display(p1)
