<!DOCTYPE html>
<html lang="en">
    <%=
        parts['head.gsp'].render([
            pageTitle: "${ globals.siteTitle }: Composers",
            ogTitle: 'Composers',
            author: 'Red Dog Ensemble',
            description: 'Composers of Red Dog Ensemble',
            path: 'composers.html'
        ])
    %>
    <body>
        <%
            // TODO: integrate Components/gcp into ssg so that this is easy and not repetetive
            out << parts['header.gsp'].render()

            texts.findAll { it.path.startsWith 'composers/' }.each {
                out << it.getExcerpt(25) << '...'
            }

            out << parts['footer.gsp'].render()
        %>
    </body>
</html>