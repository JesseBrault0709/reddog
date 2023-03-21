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
        
        def b = new StringBuilder(); // semi-colon otherwise vscode syntax highlighting breaks
        b << parts['bio/headshotTitle.gsp'].render([
            title: text.frontMatter.title,
            role: text.frontMatter.role,
            image: text.frontMatter.image
        ])
        b << tagBuilder.blockquote([
            class: 'article-excerpt'
        ], text.getExcerpt(25) + '...')
        b << tagBuilder.a([
            href: urlBuilder.relative(binding.fullPath)
        ], 'View More')

        out << parts['article/text.gsp'].render([
            content: b.toString()
        ])
    %>
</article>