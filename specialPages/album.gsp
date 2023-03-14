<!DOCTYPE html>
<html lang="en">
    <%
        def description = "Neon and Oak, Red Dog Ensemble's first album."

        out << parts['head.gsp'].render([
            author: 'Red Dog Ensemble',
            description: description,
            pageTitle: "${ globals.siteTitle }: Neon and Oak",
            og: [
                description: description,
                title: 'Neon and Oak'
            ]
        ])

        out << parts['body.gsp'].render([
            content: tagBuilder.article(texts.find { it.path == 'album.md' }.render()),
            hero: [
                src: 'neonAndOakCover.jpg',
                alt: 'Album Cover of Neon and Oak.',
                width: 500,
                height: 500
            ]
        ])
    %>
</html>