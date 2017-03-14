get_color_scheme = function(scheme_file = "cpb-color-scheme-original.csv", scheme = "Thema_CPB_Robijn_Rood")
{
	cpb_col_schemes     = read.csv(scheme_file, sep = "\t", as.is = T, header = F)
	cpb_col_scheme_name = scheme #cpb_col_schemes[0:5 * 11 +1 , 1][1]#"Thema_CPB_Robijn_Rood"

	get_rgb_col = function(i.scheme, make_black = F)
	{
		vals = cpb_col_schemes[i.scheme, 2:4]
		vals = vals / 255 / if (make_black) 2 else 1
		rgb(vals[1], vals[2], vals[3])
	}

	# background
	i.scheme = which(cpb_col_scheme_name == cpb_col_schemes[,1])
	bg = get_rgb_col(i.scheme)

	# foreground
	fg = NULL
	fg.txt = NULL
	for (i in 1:10)
	{
		fg[i] = get_rgb_col(i.scheme + i)
		fg.txt[i] = get_rgb_col(i.scheme + i, make_black = T)
	}
	
	return( list(bg = bg, fg = fg, fg.txt = fg.txt) )
}
