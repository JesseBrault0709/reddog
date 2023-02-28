<body>
    <%
        out << parts['header.gsp'].render() 
        if (binding.hero) {
            out << tagBuilder.img([
                id: 'hero',
                src: urlBuilder.relative('images/' + binding.hero.src),
                alt: binding.hero.alt,
                width: binding.hero.width,
                height: binding.hero.height
            ])
        }
    %>
    <main>
        <%= binding.content %>
    </main>
    <%
        out << parts['footer.gsp'].render()
    %>
</body>