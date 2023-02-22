using Plots
using PlotlyJS
plotlyjs()

x = range(0, 20*pi, length = 1000)
y = sin.(x)
y_shifted = circshift(y, 1)

fig = plot([y,y_shifted])
display(fig)

Statistics.cor(y, y_shifted)