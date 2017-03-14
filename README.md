# cpb-figures

These R-scripts aim to
* standardize figures as far as possible
* enable variation where needed

Show help:
```shell
RScript cpb-plot.r --help
```

Example creating a line plot:
```shell
RScript cpb-plot.r --type "line" --style "cpb-plot-styles.r" --csv "data/C17_211_fig_wrldhndel.txt" --output "output/C17_211_fig_wrldhndel.pdf" --y1lab "index 2010 = 100" --xlab "test x" --y2lab "testy2"
open output/C17_211_fig_wrldhndel.pdf
```
