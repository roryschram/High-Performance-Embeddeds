using WAV
using Plots
using PlotlyJS
plotlyjs()

amounts = [170,200,200,180,190,180,350,750,150,170,150,150,210,160,190,160,220,170,160,150];
plot = Plots.histogram(amounts, bins = 150:5:800);
xlabel!("Points Availible")
ylabel!("Frequency")
display(plot)