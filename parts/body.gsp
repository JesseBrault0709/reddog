<body>
    <div id="background-container">&nbsp;</div>
    <div id="wrapper">
        <%
            // out << parts['header.gsp'].render() 
        %>
        <main>
            <article>
                <%= binding.article %>
            </article>
        </main>
        <%
            // out << parts['footer.gsp'].render()
        %>
    </div>
</body>