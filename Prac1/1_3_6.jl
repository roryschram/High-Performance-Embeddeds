using WAV
using TickTock
using Plots
using PlotlyJS
plotlyjs()


numberOfSamples = 100


function createwhiten(n)
    whiteNoise = Array{Float64}(undef, 0)
    for i in 1:n
        append!(whiteNoise, (rand(1)*2).-1)
    end
    println("Number of samples: ", length(whiteNoise))
    WAV.wavwrite(whiteNoise, "whiteNoise2.wav", Fs=48000) #sample freq is 4800Hz
    return whiteNoise;
end

function corr(in1, in2)
    aveIn1 = 0.0
    for i in in1
        aveIn1 += i
    end
    aveIn1 = aveIn1/length(in1)
    #println(aveIn1)

    aveIn2 = 0.0
    for i in in2
        aveIn2 += i
    end
    aveIn2 = aveIn2/length(in2)
    #println(aveIn2)


    top = 0.0
    for i in 1:length(in1)
        top += (in1[i]-aveIn1)*(in2[i]-aveIn2)
    end

    bottom1 = 0.0
    for i in 1:length(in1)
        bottom1 += (in1[i]-aveIn1)^2
    end
    bottom1 = sqrt(bottom1)

    bottom2 = 0.0
    for i in 1:length(in1)
        bottom2 += (in2[i]-aveIn2)^2
    end
    bottom2 = sqrt(bottom2)

    bottom = bottom1*bottom2

    r = top/bottom
    println("The custom corrolation function gives: ",r)
end



whiteNoise1 = createwhiten(numberOfSamples);
whiteNoise2 = createwhiten(numberOfSamples);

tick()
corr(whiteNoise1, whiteNoise2);
tock()

println("The built in package gives: ")

tick()
Statistics.cor(whiteNoise1, whiteNoise2)
tock()

fig = plot([whiteNoise1,whiteNoise2])
display(fig)


