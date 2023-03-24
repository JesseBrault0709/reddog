<!DOCTYPE html>
<html lang="en">
    <%
        def text = texts.find { it.path == 'index.md' }

        out << parts['head.gsp'].render([
            description: text.getExcerpt(25) + '...',
            extraStyles: [
                'index.css'
            ],
            pageTitle: "${ globals.siteTitle }: About",
            og: [
                description: text.getExcerpt(25) + '...',
                image: urlBuilder.absolute('images/group.jpg'),
                imageWidth: 600,
                imageHeight: 400,
                title: 'About'
            ]
        ])

        out << parts['body.gsp'].render([
            content: parts['index/content.gsp'].render([
                text: text
            ])
        ])
    %>
</html>