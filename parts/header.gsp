<%
    def makeNavButton = { name, page ->
        def href = urlBuilder.relative(page)
        def a = tagBuilder.a([href: href], name)
        tagBuilder.li a
    }
%>

<header>
    <h1>$globals.siteTitle</h1>
    <nav>
        <%
            def navButtons = [
                makeNavButton('About', 'about.html'),
                makeNavButton('News', 'news.html'),
                makeNavButton('The Composers', 'composers.html'),
                makeNavButton('The Musicians', 'musicians.html'),
                makeNavButton('Donate', 'donate.html'),
                makeNavButton('Contact', 'contact.html')
            ]
            out << tagBuilder.ul(navButtons.join())
        %>
    </nav>
</header>