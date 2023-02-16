<!DOCTYPE html>
<html lang="en">
    <%
        def imageOpt = text.frontMatter.find('ogImage')

        out << parts['head.gsp'].render([
            author: 'Red Dog Ensemble',
            description: text.getExcerpt(25) + '...',
            pageTitle: "${ globals.siteTitle }: ${ frontMatter.title }",
            og: [
                description: text.getExcerpt(25) + '...',
                title: frontMatter.title,
                image: imageOpt.present ? urlBuilder.absolute('images/' + imageOpt.get()) : null,
                imageWidth: imageOpt.present ? text.frontMatter.ogImageWidth : null,
                imageHeight: imageOpt.present ? text.frontMatter.ogImageHeight : null
            ]
        ])

        out << parts['body.gsp'].render([
            content: text.render()
        ])
    %>
</html>