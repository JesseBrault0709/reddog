<body>
    <div id="background-container">&nbsp;</div>
    <div id="wrapper">
        <%
            out << parts['header.gsp'].render() 
        %>
        <main>
            <%= binding.content %>
        </main>
        <%
            out << parts['footer.gsp'].render()
        %>
    </div>
</body>