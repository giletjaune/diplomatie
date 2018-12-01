library(htmltools)
?htmltools

xx = paste(sep = "<br/>",
           "<b><a href='http://www.samurainoodle.com'>Samurai Noodle</a></b>",
           "606 5th Ave. S",
           "Seattle, WA 98138"
)
# html_print("<br> Salues la gars <br> Mais bon je n'aime pas trop ca")
html_print(html  = xx,background = "red")

htmlEscape(text = xx)


x <- matrix(1:6, nrow=2, dimnames=list(c('a','b'),c('c','d','e')))
w <- latex(x)
h <- html(w) # run HeVeA to convert .tex to .html
h <- html(x) # convert x directly to html
w <- html(x, link=c('','B'))   # hyperlink first row first col to B



el <- div(HTML("I like <u>turtles</u>"))
cat(as.character(el))


html_print(el)


html_print(HTML(rr))































require(shiny)


rr = "<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p><h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
<h1>This is a Heading</h1>
<p>This is a paragraph.</p>
"
library(htmltools)
html_print(HTML(rr))


fruits <- c("banana","raccoon","duck","grapefruit")

runApp(list(ui = pageWithSidebar(
  headerPanel("Example"),
  sidebarPanel(
    sliderInput("index", 
                label = "Select a number",
                min = 1,
                max = 4,
                step = 1,
                value = 2)),
  mainPanel(
    htmlOutput("text")
  )),
  server = function(input, output) {
    output$text <- renderUI({
      # fruits[input$index] <- paste("<b>",fruits[input$index],"</b>")
      # HTML(rr)
      xx
    })
  }
))































library(shiny)

ui <- shinyUI(fluidPage(
  
  navbarPage("",
             tabPanel(HTML("<a href='#plot3'>Home</a> "), 
                      verbatimTextOutput("Home"),
                      tableOutput("cars"),
                      plotOutput('plot'),
                      plotOutput('plot2'),
                      plotOutput('plot3')),
             tabPanel(HTML("<a href='#cars'>Test1</a> ")), 
             tabPanel(HTML("<a href='#plot'>Test2</a> ")),
             tabPanel(HTML("<a href='#plot2'>Test3</a> ")),
             tabPanel(HTML("<a href='#plot3'>Test4</a> "))
             
  )))

server <- function(input, output) {
  output$cars <- renderPrint({summary(mtcars)})
  output$plot <- renderPlot({plot(mtcars$mpg)})
  output$plot2 <- renderPlot({plot(mtcars$cyl)})
  output$plot3 <- renderPlot({plot(mtcars$hp)})
}

# Run the application 
shinyApp(ui = ui, server = server)


tt = tags$div(
  tags$p("First paragraph"), 
  tags$p("Second paragraph"), 
  tags$p("Third paragraph")
)
library(htmltools)
html_print(tt)


ff = HTML(rr)
class(ff)

