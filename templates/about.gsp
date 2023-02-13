<!DOCTYPE html>
<html lang="en">
    <%
        out << parts['head.gsp'].render([
            description: text.getExcerpt(25) + '...',
            pageTitle: "${ globals.siteTitle }: ${ frontMatter.title }",
            path: text.path,
            og: [
                description: text.getExcerpt(25) + '...',
                image: frontMatter.ogImage,
                imageWidth: frontMatter.ogImageWidth,
                imageHeight: frontMatter.ogImageHeight,
                title: frontMatter.title
            ]
        ])

        out << parts['body.gsp'].render([
            content: text.render()
        ])
    %>
</html>