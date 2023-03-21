<%
    def check = { prop ->
        if (!binding.containsKey(prop)) {
            throw new NullPointerException("${ prop } is required for bio/excerpt.gsp (called from ${ path })")
        }
    }
    check 'text'
    check 'fullPath'

    def text = binding.text
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
            <blockquote class="quote">
                <%= text.getExcerpt(25) + '...' %>
            </blockquote>
            <a href="${ urlBuilder.relative(binding.fullPath) }">View More</a>
        </div>
    </div>
</article>