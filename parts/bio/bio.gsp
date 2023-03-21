<%
    if (!text) {
        throw new NullPointerException('text must be available to use bio.gsp')
    }
%>
<article>
    <%
        def b = new StringBuilder(); // semi-colon otherwise vscode syntax highlighting breaks
        b << parts['bio/headshotTitle.gsp'].render([
            title: text.frontMatter.title,
            role: text.frontMatter.role,
            image: text.frontMatter.image,
            imageWidth: text.frontMatter.imageWidth,
            imageHeight: text.frontMatter.imageHeight
        ])
        b << text.render()

        out << parts['article/text.gsp'].render([
            content: b.toString()
        ])
    %>
</article>