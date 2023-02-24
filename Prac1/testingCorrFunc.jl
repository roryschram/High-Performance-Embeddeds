using Statistics

### Utalizing the function with the for loop to generate the data
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
    
    return r
end


whiteNoise1 = (rand(48000)*2).-1
whiteNoise2 = whiteNoise1

println("\n\n#### Corr. between the same datasets. IE should be ~1.0 ####\n")
println("Custom corr. function...")
println("The corr. between the datasets is: ", corr(whiteNoise1, whiteNoise2))
println("\nBuiltin corr. function....")
println("The corr. between the datasets is: ", Statistics.cor(whiteNoise1, whiteNoise2))


whiteNoise1 = (rand(48000)*2).-1
whiteNoise2 = (rand(48000)*2).-1

println("\n\n#### Corr. between different datasets. IE should be ~0.0 ####\n")
println("Custom corr. function...")
println("The corr. between the datasets is: ", corr(whiteNoise1, whiteNoise2))
println("\nBuiltin corr. function....")
println("The corr. between the datasets is: ", Statistics.cor(whiteNoise1, whiteNoise2))