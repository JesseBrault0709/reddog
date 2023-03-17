<!DOCTYPE html>
<html lang="en">
    <%
        out << parts['head.gsp'].render([
            author: globals.siteAuthor,
            description: 'Contact Red Dog Ensemble',
            extraStyles: ['contact.css'],
            pageTitle: "${ globals.siteTitle }: Contact",
            og: [
                description: 'Contact Red Dog Ensemble',
                title: 'Contact'
            ]
        ])

        out << parts['body.gsp'].render([
            content: parts['contact/form.gsp'].render(),
            extraScripts: ['contact.js']
        ])
    %>
</html>