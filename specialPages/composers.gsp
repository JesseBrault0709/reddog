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
            def content = texts.findAll { it.path.startsWith 'composers/' }.collect { text ->
                def fullPath = tasks.findAllByType(taskTypes.textToHtmlFile).find {
                    it.input.path == text.path
                }?.output?.htmlPath

                if (fullPath == null) {
                    throw new NullPointerException("could not find a matching fullPath for ${ text.path }")
                } else {
                    return parts['bio/excerpt.gsp'].render([
                        text: text,
                        fullPath: fullPath 
                    ])
                }
            }.join('\n')

            out << parts['body.gsp'].render([
                content: content
            ])
        %>
    </body>
</html>