# RScript cpb-plot.r --type "line" --style "cpb-plot-styles.r" --csv "data/C17_211_fig_wrldhndel.txt" --output "output/fig.pdf" --y1lab "index 2010 = 100" --xlab "test x" --y2lab "testy2"; open output/fig.pdf

DEBUG = interactive()

#
## Parse command line arguments
#
if (!DEBUG) source('cpb-plot-parse-arguments.r')
source("cpb-plot-init-functions.r")
source("cpb-plot-styles.r")

if (DEBUG) csvdata = read.csv("data/C17_211_fig_wrldhndel.txt", sep = "\t", header = F, as.is = T)

# if (PLOT.TYPE.LINE == arg$type)
# {
#
# }

#
## Pre-process csvdata and store in matrix
#
index       = 3:nrow(csvdata)
y           = as.matrix(csvdata[index, 2:ncol(csvdata)])
colnames(y) = csvdata[2, 2:ncol(csvdata)]
class(y)    = "numeric"
rownames(y) = x = csvdata[index, 1]
nc			= ncol(y)
y.range		= range(y)

#
## Plot!
#
if (DEBUG)
{
	while (1 != dev.cur()) dev.off() # close all plot windows
	dev.new(file = arg$output, width = pdf_width, height = pdf_height, bg = cols$bg)
} else {
	pdf(file = arg$output, width = pdf_width, height = pdf_height, bg = cols$bg)
}

par(mai = pdf_mai)
plot(0, 0, axes = F, ylim = y.range, xlab = "", ylab = "", t = "n", bg = "red")
abline(h = 0, lty = 2)
par(new = T)
curves = list()
for (i in 1:nc)
{
	plot(x, y[, i], axes = F, ylim = y.range, xlab = "", ylab = "", t = "l", lwd = line_lwd, col = cols$fg[i])
	curves[[i]] = list(x = x, y = y[, i])
	par(new = i < nc)
}

# do axes
	#x.label.pos		= axis(1, lwd = 0, labels = NA)
	#x.range			= range(x.label.pos)
	#x.period		= diff(x[1:2])
	#axis(1, at = x.period / 2 + seq(x.range[1] - x.period, x.range[2]), labels = NA) # first the labels
axis(1, tick = F) # now the numbers
axis(2, tick = F, las = 2)
title(xlab = arg$xlab, ylab = arg$y1lab)
mtext(arg$y2lab,side=4,line=3)

# add labels
#Hmisc::labcurve(curves, labels = colnames(y), col = cols$fg.txt, adj = 0, cex = 1.1, method = "arrow", arrow.factor = 2)
Hmisc::labcurve(curves, labels = colnames(y), col = cols$fg.txt, cex = 1.1)