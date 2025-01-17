---
title: On Outliers
author: ~
date: '2021-10-18'
slug: on-outliers
categories: []
tags: []
images: []
---




In exploratory data analysis, we talk about getting to know our data through measures of central tendency (mean, median, weighted mean, weighted median), and measures of spread (range, interquartile range, variance, standard deviation). It is at this time that students of data analysis get introduced to the concept of "outliers". However, at this point, depending on the textbook and/or discipline used, they might encounter different definitions of what is an outlier, and different techniques for addressing these outliers. In this post, I want to try to consolidate some of these, and explore to what extent this matters.


## What makes an observation an outlier? 

[Practical Statistics for Data Scientists](https://www.oreilly.com/library/view/practical-statistics-for/9781491952955/) defines an outlier as:

> A data value that is very different from most of the data.

Later on, the authors say "*[t]he exact definition of an outlier is somewhat subjective*"


## Waiter, there is an outlier in my boxplot!

A common way outliers are detected is when we plot the data using a [box plot](). 

## So what should we do about outliers?

The question is usually boiled down to whether we want to include or excludethe outliers in our analysis. 


