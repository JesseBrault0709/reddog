<!DOCTYPE html>
<html lang="en">
    <%=
        parts['head.gsp'].render([
            author: 'Red Dog Ensemble',
            description: 'News about Red Dog Ensemble.',
            pageTitle: "${ globals.siteTitle }: News",
            path: 'news.html',
            og: [
                description: 'News about Red Dog Ensemble.',
                title: 'News'
            ]
        ])
    %>
    <body>
        <%
            // TODO: integrate Components/gcp into ssg so that this is easy and not repetetive
            out << parts['header.gsp'].render()

            texts.findAll { it.path.startsWith 'posts/' }.each {
                out << it.render()
            }

            out << parts['footer.gsp'].render()
        %>
    </body>
</html>