using WAV
using Plots
using PlotlyJS
plotlyjs()

whiteNoise = (rand(48000)*2).-1
WAV.wavwrite(whiteNoise, "whiteNoise1.wav", Fs=4800) #sample freq is 4800Hz

p1 = Plots.histogram(whiteNoise)
title!("Random Number Distrobution")
yaxis!("Frequency")
xaxis!("Number Generated")




### Utalizing the function with the for loop to generate the data

function createwhiten(n)
    whiteNoise = Array{Float64}(undef, 0)
    for i in 1:n
        append!(whiteNoise, (rand(48000)*2).-1)
    end
    println("Number of samples: ", length(whiteNoise))
    WAV.wavwrite(whiteNoise, "whiteNoise2.wav", Fs=4800) #sample freq is 4800Hz
    return whiteNoise;
end

whiteNoiseForLoop = createwhiten(1)

p2 = Plots.histogram(whiteNoiseForLoop)
title!("Random Number Distrobution")
yaxis!("Frequency")
xaxis!("Number Generated")

l = @layout [p1 ; p2]
plot(p1,p2, layout = grid(2,1), vertical_spacing=5)

