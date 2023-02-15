<!DOCTYPE html>
<html lang="en">
    <%
        out << parts['head.gsp'].render([
            author: 'Red Dog Ensemble',
            description: text.getExcerpt(25) + '...',
            pageTitle: "${ globals.siteTitle }: ${ frontMatter.title }",
            og: [
                description: text.getExcerpt(25) + '...',
                title: frontMatter.title,
                image: frontMatter.find('ogImage').orElse(null),
                imageWidth: frontMatter.find('ogImageWidth').orElse(null),
                imageHeight: frontMatter.find('ogImageHeight').orElse(null)
            ]
        ])

        out << parts['body.gsp'].render([
            content: text.render()
        ])
    %>
</html>