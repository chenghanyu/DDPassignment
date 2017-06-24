---
title       : My fancy slides
author      : Cheng-Han Yu
job         : Applied Math and Statistics, UC Santa Cruz
framework   : io2012  
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, bootstrap, quiz]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
date        : June 22, 2017
output: 
  ioslides_presentation:
    incremental: no
    logo: soelogo.jpg
    footer: no
    widescreen: yes
    transition: default
    css: ioslides_style.css
    fig_width: 5
    fig_height: 3
    fig_caption: true
    mathjax: "default"
    keep_md: no
---



## R Markdown

This is an R Markdown presentation. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document.

## Slide with Bullets

- Bullet 1
- Bullet 2
- Bullet 3

## Slide with R Output


```r
summary(cars)
```

```
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

## Slide with Plot


```r
plot(pressure)
```

![plot of chunk pressure](assets/fig/pressure-1.png)

