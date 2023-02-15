<!DOCTYPE html>
<html lang="en">
    <%
        out << parts['head.gsp'].render([
            author: text.frontMatter.author,
            description: text.getExcerpt(25) + '...',
            og: [
                title: text.frontMatter.title,
                description: text.getExcerpt(25) + '...',
                image: urlBuilder.relative('images/' + text.frontMatter.image),
                imageWidth: text.frontMatter.imageWidth,
                imageHeight: text.frontMatter.imageHeight
            ],
            pageTitle: globals.siteTitle + ': ' + text.frontMatter.title
        ])

        out << parts['body.gsp'].render([
            content: parts['postArticle.gsp'].render()
        ])
    %>
</html>