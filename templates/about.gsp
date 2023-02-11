<!DOCTYPE html>
<html lang="en">
    <%=
        parts['head.gsp'].render([
            pageTitle: "${ globals.siteTitle }: ${ frontMatter.title }",
            ogTitle: frontMatter.title,
            author: frontMatter.author,
            description: frontMatter.description,
            path: frontMatter.path,
            ogImage: frontMatter.ogImage,
            ogImageWidth: frontMatter.ogImageWidth,
            ogImageHeight: frontMatter.ogImageHeight
        ])
    %>
    <%=
        parts['body.gsp'].render([
            article: text
        ])
    %>
</html>