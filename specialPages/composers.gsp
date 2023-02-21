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

            texts.findAll { it.path.startsWith 'composers/' }.each { text ->
                def fullPath = tasks.findAllByType(taskTypes.textToHtmlFile).find {
                    it.input.path == text.path
                }?.output.htmlPath

                if (fullPath == null) {
                    throw new NullPointerException("could not find a matching fullPath for ${ text.path }")
                } else {
                    out << parts['bio/excerpt.gsp'].render([
                        text: text,
                        fullPath: fullPath 
                    ])
                }
            }

            out << parts['footer.gsp'].render()
        %>
    </body>
</html>