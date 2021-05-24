---
title: Minimizing Misrepresentation in Spatial Data Visualizations
author: R package build
date: '2021-05-24'
slug: []
categories: []
tags: []
images: []
---

Early last autumn I was contacted by the team at [Sage Research Methods](http://methods.sagepub.com/) about their project putting together a [Data Visualisation Collection](https://uk.sagepub.com/en-gb/eur/sage-research-methods-data-visualization) of online resources. 


The idea is to create online teaching material (video tutorials, text entries, datasets, and so on) introducing fundamentals of data and design necessary to create impactful visualizations. 


To contribute to this resource, I teamed up with Sage to summarise the key learnings from our paper with [Dr Sam Langton](https://www.samlangton.info/), [Cartograms, hexograms and regular grids: Minimising misrepresentation in spatial data visualisations ](https://journals.sagepub.com/doi/figure/10.1177/2399808319873923?) in a short video clip. 

This is now online and abailable here: [http://methods.sagepub.com/video/srmpromo/MfaJ2O/minimizing-misrepresentation-in-spatial-data-visualizations](http://methods.sagepub.com/video/srmpromo/MfaJ2O/minimizing-misrepresentation-in-spatial-data-visualizations)

![Screengrab of Sage video](/img/sage_vid_screenshot.png)
- *Screengrab of Sage video*

## Transforming polygons: a summary

The premise of the paper and the video is that in some cases, the size and the shape of the polygons in our data may distract our viewers from our intended key message.  For example, looking at Local Authorities across the country makes London look very small: 

![Map of Local Authorities in England using Original Boundaries (note London LAs barely visible).](/img/original_la_map.png)
- *Map of Local Authorities in England using Original Boundaries (note London LAs barely visible).*

In these cases, we might wish to change this through transforming these polygons. Here we discuss 4 transformations: balanced area cartogram, hexogram, and uniform hexagonal and rectangular grids.  

- **Cartograms** traditionally use a variable (e.g. population size) to distort the geography of our areas. **Balanced area cartograms** aim to minimise the [distorting side-effects of cartograms](https://journals.sagepub.com/doi/full/10.1177/0308518X17708439) by pre-defining an *‘interpretability threshold’* which is the smallest legible unit size given the dimensions of the final published map.
- **Hexograms** apply the balanced area approach, implementing an iterative binning algorithm which assigns the centroid of the polygons from the balanced cartogram to tessellated hexagons, each representing the original polygons. Doing so [maintains spatial accuracy whilst also being uniform in shape and size](https://research-information.bris.ac.uk/en/publications/using-hexograms-to-map-areal-data). 
- Finally, in uniform **hexagonal** and **square tile** grids the original geometry is transformed to tessellating  hexagons or squares, while minimising the total distance between the centroid of every original geography and its new centroid on the grid. In our paper we implemented this using the [geogrid R package](https://github.com/jbaileyh/geogrid) using the [Hungarian algorithm](https://en.wikipedia.org/wiki/Hungarian_algorithm). 


The four transformations result in these augmented maps: 

![Transformed maps of Local Authority areas in England using (a) balanced cartogram, (b) hexogram, (c) square grid, (d) hexagonal grid.](/img/transformed_la_maps.png)
- *Transformed maps of Local Authority areas in England using (a) balanced cartogram, (b) hexogram, (c) square grid, (d) hexagonal grid.*


After asking a sample of 600+ strangers on the internet to view these maps and either agree or disagree with the statement which we indeneded to communicate with the map overall, we were able to compare whether there were differences between the map transformations in the extent to which people agreed with the intended message. 

We found that depending on which map we used, people either agreed more or less with the statement, compared with the original geographic boundaries. 

<img src="/blog/2021-05-24-minimizing-misrepresentation-in-spatial-data-visualizations_files/figure-html/unnamed-chunk-1-1.png" width="672" />
- *Proportion who agree to disagree with our statement which we think the map should convey. Higher agreement means a better map.*


The key message from this is that these transformations do indeed affect how your audiences will read your map, and the kind of transformation applied will have an effect on the extent and direction of this. Therefore we recommend trying out multiple approaches, and making sure that the chosen approach best represents the message being communicated. 

## The video

To watch the video summary of this, visit the Sage Research Methods website or go directly with the link here: [http://methods.sagepub.com/video/srmpromo/MfaJ2O/minimizing-misrepresentation-in-spatial-data-visualizations](http://methods.sagepub.com/video/srmpromo/MfaJ2O/minimizing-misrepresentation-in-spatial-data-visualizations). 

## The code

If you wanted to have a look at the code behind the transformations, you can see the GitHub repository here: [https://github.com/langtonhugh/EPB_maps](https://github.com/langtonhugh/EPB_maps) or watch the talk I gabe at PyData Manchester in July [https://youtu.be/xUWDBQ4wCqU?t=3245](https://youtu.be/xUWDBQ4wCqU?t=3245)
