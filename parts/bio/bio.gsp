<%
    if (!text) {
        throw new NullPointerException('text must be available to use bio.gsp')
    }
%>
<article>
    <div class="gap-1 column-600">
        <%=
            parts['bio/headshotTitle.gsp'].render([
                title: text.frontMatter.title,
                role: text.frontMatter.role,
                image: text.frontMatter.image
            ])
        %>
        <div class="gap-1 left-right-padded">
            <%= text.render() %>
        </div>
    </div>
</article>