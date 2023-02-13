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
            def textExcerpts = texts.findAll { it.path.startsWith 'posts/' }.collect {
                parts['newsExcerpt.gsp'].render([
                    title: it.frontMatter.title,
                    date: it.frontMatter.date,
                    author: it.frontMatter.author,
                    excerpt: it.getExcerpt(25) + '...',
                    link: 'TODO'
                ])
            }.join()

            out << parts['body.gsp'].render([
                content: textExcerpts
            ])
        %>
    </body>
</html>