#
## Define here all plot styles
#

# get colors
cols = get_color_scheme("cpb-color-scheme-original.csv", "cpb_md_light")

# line specs
line_lwd = 5

# horizontal line at zero
line_zero_lwd = 2
line_zero_col = "lightgray"

# future
future_col = "skyblue"

# get dimensions TODO: needs to be parameterized...
pdf_width	= 7.5 # cm
pdf_height	= 4.9 # cm

# margins
pdf_mai = c(1.02, 1.02, 0, 1.02) # 0.82