<!DOCTYPE html>
<html lang="en">
    <%=
        parts['head.gsp'].render([
            pageTitle: "${ globals.siteTitle }: News",
            ogTitle: 'News',
            author: 'Red Dog Ensemble',
            description: 'News for Red Dog Ensemble',
            path: 'news.html',
            // ogImage: frontMatter.ogImage,
            // ogImageWidth: frontMatter.ogImageWidth,
            // ogImageHeight: frontMatter.ogImageHeight
        ])
    %>
    <body>
        <%
            // TODO: integrate Components/gcp into ssg so that this is easy and not repetetive
            out << parts['header.gsp'].render()

            texts.findAll { it.path.startsWith 'posts/' }.each {
                out << it.render()
            }

            out << parts['footer.gsp'].render()
        %>
    </body>
</html>