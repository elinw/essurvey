
<img src="man/figures/ess_logo.png" align="right" />
====================================================

Overview
--------

The European Social Survey (ESS) is an academically driven cross-national survey that has been conducted across Europe since its establishment in 2001. Every two years, face-to-face interviews are conducted with newly selected, cross-sectional samples. The survey measures the attitudes, beliefs and behaviour patterns of diverse populations in more than thirty nations. Taken from the [ESS website](http://www.europeansocialsurvey.org/about/).

The `ess` package is designed to download the ESS data as easily as possible. This is very first stage of the package. At this moment there is only one function that allows you to download all available waves from their website, or simply just a selected number. The next stage of the package is concerned with not only downloading separate waves (which takes a fair amount of time) but to be able to download all waves for a specific country.

Installation
------------

You can install and load the package with these commands:

``` r
# install.packages("devtools") in case you don't have it
devtools::install_github("cimentadaj/ess")
```

For now the package will be available in Github but sometime in the near future it will be submitted to CRAN.

Usage
-----

First, you need to register at the ESS website, in case you haven't. Please visit the [register](http://www.europeansocialsurvey.org/user/new) section from the ESS website. If your email is not registered at their website, an error will be raised prompting you to go register.Eur

To download the first wave to use in R:

``` r
three_waves <- ess_waves(1, "your_email@email.com")
```

This will return a list object with wave 1 in the first slot. You can also download several waves by just supplying the number of the waves.

``` r
three_waves <- ess_waves(1:5, "your_email@email.com")
```

This will download all latest versions of waves 1 through 5 and return a list of length 5 with wave as a data frame inside the list.

You should make sure you download the correct waves available at [their website](http://www.europeansocialsurvey.org/data/round-index.html) because if you supply a non existent wave, the function will return an error.

``` r
three_waves <- ess_waves(c(1, 8), "your_email@email.com")

#> Error in ess_url(waves) :
#> ESS round 8 is not a available at
#> http://www.europeansocialsurvey.org/data/round-index.html
```
