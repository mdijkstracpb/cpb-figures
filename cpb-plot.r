.DEBUG = interactive(); if (.DEBUG) rm(list = ls())

#
## Parse command line arguments
#
source("cpb-plot-init-functions.r")
source("cpb-plot-styles.r")
source("cpb-plot-helper-functions.r")

if (.DEBUG)
{
	# csvdata = read.csv("data/C17_211_fig_wrldhndel.txt", sep = "\t", header = F, as.is = T) # C17_211_fig_wrldhndel.txt # C17_233_bedr_inves_ex_wo
	csvdata = read.csv("data/15mrt/C17_357_kader-terugblik.txt", sep = "\t", header = F, as.is = T) # C17_211_fig_wrldhndel.txt # C17_233_bedr_inves_ex_wo
	arg = NULL
	arg$type = PLOT.TYPE.LINE
	arg$future = 2010
} else {
	source('cpb-plot-parse-arguments.r')
}

#
## Pre-process csvdata and store in matrix
#
# Clean csv
csvdata     = clean_csv(csvdata)
index       = 3:nrow(csvdata)
y           = as.matrix(csvdata[index, 2:ncol(csvdata)])
nc			= ncol(y)
colnames(y) = csvdata[2, 2:ncol(csvdata)]
class(y)    = "numeric"
rownames(y) = x = csvdata[index, 1]
# Determine x.range and y.range and deal with NA's in x
y.range		= range(y)
x_show      = if (any(is.na(x))) x[which(!is.na(x))] else NULL # if x_show == NULL, then let R decide where to place labels
x           = fill_x(x)
x.range		= range(x)


#
## Open device
#
if (.DEBUG)
{
	while (1 != dev.cur()) dev.off() # close all plot windows
	dev.new(width = pdf_width, height = pdf_height, bg = cols$bg)
} else {
	pdf(file = arg$output, width = pdf_width, height = pdf_height, bg = cols$bg)
}

par(mai = pdf_mai)

# Set bg + future
plot(0, 0, axes = F, xlim = x.range, ylim = y.range, xlab = "", ylab = "", t = "n", bg = "red")
rect(arg$future, y.range[1], x.range[2], y.range[2], density = 20, col = future_col, border = NA)
par(new = T)

# horizontal line at zero
abline(h = 0, lty = 2, col = line_zero_col, lwd = line_zero_lwd)

if (PLOT.TYPE.LINE == arg$type)
{
	curves = list()
	for (i in 1:nc)
	{
		plot(x, y[, i], axes = F, xlim = x.range, ylim = y.range, xlab = "", ylab = "", t = "l", lwd = line_lwd, col = cols$fg[i])
		curves[[1 + length(curves)]] = list(x = x, y = y[, i])
		par(new = i < nc)
	}
}

if (PLOT.TYPE.BARV == arg$type)
{
	for (i in 1:nc)
	{
		
	}
}

# Make axes
#x.label.pos = axis(1, lwd = 0, labels = NA)
#x.period    = diff(x[1:2])
#axis(1, at = x.period / 2 + seq(min(x.label.pos) - x.period, max(x.label.pos)), labels = NA) # first the labels
axis(1, tick = F) # now the numbers
axis(2, tick = F, las = 2)
title(xlab = arg$xlab)
title(ylab = arg$y1lab)
mtext(arg$y2lab,side=4,line=3)

# add labels
#Hmisc::labcurve(curves, labels = colnames(y), col = cols$fg.txt, adj = 0, cex = 1.1, method = "arrow", arrow.factor = 2)
if (PLOT.TYPE.LINE == arg$type) Hmisc::labcurve(curves, labels = colnames(y), col = cols$fg.txt, cex = 1.1)