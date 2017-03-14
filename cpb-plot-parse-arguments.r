library("optparse")

#
## Define constants
#
PLOT.TYPE.LINE     = "line" # for line plot
PLOT.TYPE.BARH     = "barh" # for horizontal bar plot
PLOT.TYPE.BARV     = "barv" # for vertical bar plot
PLOT.TYPE.BARVLINE = "barvline" # for vertical bar plot with line
PLOT.TYPES         = list(PLOT.TYPE.LINE) # add implemented types here

#
## Define argument specification
#
option_list = list(
  make_option(c("-t", "--type"),     type = "character", default = "line", help = "type of plot: barh, barv, barvline, line, ... [default = %default]", metavar = "character"),
  make_option(c("-s", "--style"),    type = "character", default = "cpb-plot-styles.r", help = "file with styling options [default = %default]", metavar = "character"),
  make_option(c("-c", "--csv"),      type = "character", default = NULL, help = "input csv file (use tab as delimiter, dot as decimal)", metavar = "character"),
  make_option(c("-o", "--output"),   type = "character", default = NULL, help = "output file (extensions are postfixed)", metavar = "character"),
  make_option(c("-x", "--xlab"),     type = "character", default = NULL, help = "text at x-axis", metavar = "character"),
  make_option(c("-y1", "--y1lab"),   type = "character", default = NULL, help = "text at left y-axis", metavar = "character"),
  make_option(c("-y2", "--y2lab"),   type = "character", default = NULL, help = "text at right y-axis", metavar = "character"),
  make_option(c("-f", "--future"),   type = "integer",   default = NULL, help = "from this point on, data are predicted", metavar = "integer")
)

#
## Parse command line arguments
#
opt_parser = OptionParser(option_list = option_list)
arg = parse_args(opt_parser)

#
## Check arguments and show help if incorrect (or not implemented yet)
#
print_error = function(msg)
{
    cat("ERROR\n")
    cat(paste0("ERROR ", msg, "\n"))
    cat("ERROR\n\n")
	stop()	
}

if (is.null(arg$csv))
{
  print_help(opt_parser)
  print_error("You must specify a valid --csv")
}
if (!is.element(arg$type, PLOT.TYPES))
{
  print_help(opt_parser)
  print_error("This --type is not implemented yet.")
}

#
## Fix missing arguments
#
if (is.null(arg$output))
{
	arg$output = paste0(arg$csv, ".pdf")
}

#
## Read input file
#
csvdata = read.csv(arg$csv, sep = "\t", header = F, as.is = T)