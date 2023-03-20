<!DOCTYPE html>
<html lang="en">
    <%
        def description = "Neon and Oak, Red Dog Ensemble's first album."

        out << parts['head.gsp'].render([
            author: 'Red Dog Ensemble',
            description: description,
            extraStyles: ['album.css'],
            pageTitle: "${ globals.siteTitle }: Neon and Oak",
            og: [
                description: description,
                title: 'Neon and Oak'
            ]
        ])

        out << parts['body.gsp'].render([
            content: parts['album/content.gsp'].render()
        ])
    %>
</html>