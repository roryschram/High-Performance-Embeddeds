using Plots
using Statistics

x = range(0, 16*pi, length = 1000)
y = sin.(x)

corrolationAfterShift = zeros(size(x))

for i in 0:999
    global y_shifted = circshift(y, i)
    corrolationAfterShift[i+1] = Statistics.cor(y, y_shifted)
    #println(Statistics.cor(y, y_shifted))
end

l = @layout [a ; b]
p1 = plot([y,y_shifted])
title!("Shifted Sinusoids")
xlabel!("Samples")
ylabel!("y1 and y2")

p2 = plot(corrolationAfterShift)
xlabel!("Samples")
ylabel!("Corrolation")
title!("Corrolation between the two shifted sinusoids")
fig = plot(p1, p2, layout = l)

display(fig)