blogdown::new_site(theme = "koirand/pulp", theme_example = TRUE)
blogdown::new_site(theme = "gcushen/hugo-academic")

blogdown::new_site()
blogdown::install_theme("koirand/pulp", force = TRUE)
blogdown::serve_site()
blogdown::stop_server()
blogdown::new_post(title="ECCA 2022", ext = ".Rmarkdown", subdir = 'blog')

blogdown::check_site()
blogdown::hugo_version()
