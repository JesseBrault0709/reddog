<!DOCTYPE html>
<html lang="en">
    <%
        out << parts['bio/collection.gsp'].render([
            author: globals.siteAuthor,
            description: 'Composers of Red Dog Ensemble',
            pageTitle: "${ globals.siteTitle }: Composers",
            ogTitle: 'Composers',
            textsPath: 'composers/'
        ])
    %>
</html>