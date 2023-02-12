<!DOCTYPE html>
<html lang="en">
    <%=
        parts['head.gsp'].render([
            author: 'Red Dog Ensemble',
            description: 'Composers of Red Dog Ensemble.',
            pageTitle: "${ globals.siteTitle }: Composers",
            path: 'composers.html',
            og: [
                description: 'Composers of Red Dog Ensemble.',
                title: 'Composers'
            ]
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