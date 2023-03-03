<!DOCTYPE html>
<html lang="en">
    <%
        out << parts['head.gsp'].render([
            author: globals.siteAuthor,
            description: 'Contact Red Dog Ensemble',
            pageTitle: "${ globals.siteTitle }: Contact",
            og: [
                description: 'Contact Red Dog Ensemble',
                title: 'Contact'
            ]
        ])

        out << parts['body.gsp'].render([
            content: tagBuilder.article(texts.find { it.path == 'contact.md' }.render())
        ])
    %>
</html>