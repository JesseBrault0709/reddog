<!DOCTYPE html>
<html lang="en">
    <%
        out << parts['head.gsp'].render([
            description: text.getExcerpt(25) + '...',
            pageTitle: "${ globals.siteTitle }: ${ text.frontMatter.title }",
            og: [
                description: text.getExcerpt(25) + '...',
                image: urlBuilder.absolute('images/' + text.frontMatter.ogImage),
                imageWidth: text.frontMatter.ogImageWidth,
                imageHeight: text.frontMatter.ogImageHeight,
                title: text.frontMatter.title
            ]
        ])

        out << parts['body.gsp'].render([
            content: tagBuilder.article(text.render()),
            hero: [
                src: text.frontMatter.heroSrc,
                alt: text.frontMatter.heroAlt,
                width: text.frontMatter.heroWidth,
                height: text.frontMatter.heroHeight
            ]
        ])
    %>
</html>