<%
    def check = { prop ->
        if (!binding.containsKey(prop)) {
            throw new NullPointerException("${ prop } is required for bio/excerpt.gsp (called from ${ path })")
        }
    }
    check 'text'
    check 'fullPath'
%>
<article>
    <%
        def text = binding.text
        out << parts['bio/headshotTitle.gsp'].render([
            title: text.frontMatter.title,
            role: text.frontMatter.role,
            image: text.frontMatter.image
        ])
        out << tagBuilder.blockquote([
            class: 'article-excerpt'
        ], text.getExcerpt(25) + '...')
        out << tagBuilder.a([
            href: urlBuilder.relative(binding.fullPath)
        ], 'View More')
    %>
</article>