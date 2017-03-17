#
## Define constants
#
PLOT.TYPE.SCATTER  = "scatter" # for line plot
PLOT.TYPE.LINE     = "line" # for line plot
PLOT.TYPE.BARH     = "barh" # for horizontal bar plot
PLOT.TYPE.BARV     = "barv" # for vertical bar plot
PLOT.TYPE.BARVLINE = "barvline" # for vertical bar plot with line
PLOT.TYPES         = c(PLOT.TYPE.SCATTER, PLOT.TYPE.LINE, PLOT.TYPE.BARV, PLOT.TYPE.BARH, PLOT.TYPE.BARVLINE) # add implemented types here


#
## Define all plot styles
#

# horizontal line at zero
line_zero_lty = 2
line_zero_lwd = 2
line_zero_col = "#F0F0F0"

# axes
axis_lab_col = 1

# future
future_col = "skyblue"

# get colors
cols = get_color_scheme("cpb-color-scheme-original.csv", "cpb_md_light")

# PLOT.TYPE.SCATTER
symbol = c(1, 3:11)

# PLOT.TYPE.LINE
line_lwd = 5

# get dimensions TODO: needs to be parameterized...
pdf_width	= 7.5 # cm
pdf_height	= 4.9 # cm

# margins
pdf_mai = c(1.02, 1.02, 0, 1.02) # 0.82