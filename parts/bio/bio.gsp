<%
    if (!text) {
        throw new NullPointerException('text must be available to use bio.gsp')
    }
%>
<article>
    <%
        out << parts['bio/headshotTitle.gsp'].render([
            title: text.frontMatter.title,
            role: text.frontMatter.role,
            image: text.frontMatter.image,
            imageWidth: text.frontMatter.imageWidth,
            imageHeight: text.frontMatter.imageHeight
        ])
        out << text.render()
    %>
</article>