blogdown::new_site(theme = "koirand/pulp", theme_example = TRUE)
blogdown::new_site(theme = "gcushen/hugo-academic")

blogdown::new_site()
blogdown::install_theme("koirand/pulp", force = TRUE)
blogdown::serve_site()
blogdown::new_post(title="reading for presentation skills", 
         ext = getOption("blogdown.ext", ".Rmd"))



