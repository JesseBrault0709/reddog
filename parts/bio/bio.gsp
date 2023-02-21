<%
    if (!text) {
        throw new NullPointerException('text must be available to use bio.gsp')
    }
%>
<article>
    <%
        out << parts['bio/headshotTitle.gsp'].render()
        out << text.render()
    %>
</article>