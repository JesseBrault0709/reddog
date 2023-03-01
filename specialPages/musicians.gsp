<!DOCTYPE html>
<html lang="en">
    <%
        out << parts['bio/collection.gsp'].render([
            author: globals.siteAuthor,
            description: 'Musicians of Red Dog Ensemble',
            pageTitle: "${ globals.siteTitle }: Musicians",
            ogTitle: 'Muscians',
            textsPath: 'musicians/'
        ])
    %>
</html>