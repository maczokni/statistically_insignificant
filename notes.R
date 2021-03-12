blogdown::new_site(theme = "koirand/pulp", theme_example = TRUE)
blogdown::new_site(theme = "gcushen/hugo-academic")

blogdown::new_site()
blogdown::install_theme("koirand/pulp", force = TRUE)
blogdown::serve_site()
blogdown::stop_server()
blogdown::new_post(title="A response to: on the safety of women", ext = ".Rmarkdown", subdir = 'blog')

blogdown::check_site()
