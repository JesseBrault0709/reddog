<%
    if (text == null) {
        throw new IllegalArgumentException('A Text is required for postArticle.gsp')
    }
%>
<article>
    <%
        out << tagBuilder.h2(text.frontMatter.title)
        out << parts['postInfo.gsp'].render()

        if (text.frontMatter.image) {
            out << tagBuilder.img([
                alt: text.frontMatter.imageAlt,
                src: urlBuilder.relative('images/' + text.frontMatter.image)
            ])
        }

        out << text.render()
    %>
</article>