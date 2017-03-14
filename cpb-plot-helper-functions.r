clean_csv = function(csvdata)
{
	n_na = apply(csvdata, 2, function(vec) length(which(is.na(vec))))
	index_emtpy_columns = which(nrow(csvdata) == n_na)
	
	csvdata[, -index_emtpy_columns]
}

fill_x = function(x)
{
	index = which(!is.na(x)) # index of valid x-values
	
	if (1 != index[1]) stop("TO DO: fix if first x-value is NA...")
	period = diff(x[index])[1] / diff(index)[1]

	current = x[1]
	for (i in 1:length(x))
	{
		if (is.na(x[i]))
		{
			x[i] = current + period
		}
		current = x[i]
	}
	
	x
}